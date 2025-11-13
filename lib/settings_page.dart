import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart' show Consumer, ReadContext;
import 'package:quitter/about_page.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/app_scheme.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/enjoying_page.dart';
import 'package:quitter/settings_provider.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:quitter/tasks.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/whats_new.dart';
import 'package:quitter/app_theme_mode.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _searchController = TextEditingController();
  final _pinTimeoutController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    final settings = context.read<SettingsProvider>();
    _pinTimeoutController.text = settings.pinTimeout.toString();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SettingsProvider>(
          builder: (context, settings, child) {
            final List<Widget> allSettingsItems = _buildAllSettingsItems(
              context,
              settings,
            );
            final List<Widget> filteredItems = _searchQuery.isEmpty
                ? allSettingsItems
                : allSettingsItems
                      .where((item) => _matchesSearch(item, _searchQuery))
                      .toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: SearchBar(
                    leading: Icon(Icons.search),
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    hintText: 'Search...',
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: filteredItems,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _exportData(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {};
    for (String key in prefs.getKeys()) {
      data[key] = prefs.get(key);
    }

    final json = jsonEncode(data);

    final path = await FilePicker.platform.saveFile(
      dialogTitle: 'Save data to',
      fileName: 'quitter.json',
      type: FileType.custom,
      allowedExtensions: ['json'],
      bytes: Uint8List.fromList(json.codeUnits),
    );

    if (defaultTargetPlatform == TargetPlatform.linux) {
      final file = File(path!);
      await file.writeAsString(json);
    }

    if (!context.mounted || path == null) return;
    toast(context, 'Data exported!');
  }

  Future<void> _importData(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    if (result == null) return;

    File file = File(result.files.single.path!);
    String contents = await file.readAsString();
    Map<String, dynamic> data = jsonDecode(contents);

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    for (final entry in data.entries) {
      final key = entry.key;
      final value = entry.value;
      if (value is bool) {
        await prefs.setBool(key, value);
      } else if (value is int) {
        await prefs.setInt(key, value);
      } else if (value is double) {
        await prefs.setDouble(key, value);
      } else if (value is String) {
        await prefs.setString(key, value);
      }
    }

    if (!context.mounted) return;
    toast(context, 'Data imported successfully!');

    final addictions = context.read<AddictionProvider>();
    await addictions.loadAddictions();
    if (!context.mounted || defaultTargetPlatform == TargetPlatform.linux)
      return;

    final settings = context.read<SettingsProvider>();
    if (settings.notifyEvery == 0) return;
    if (addictions.quitAlcohol == null &&
        addictions.quitMarijuana == null &&
        addictions.quitPouches == null &&
        addictions.quitOpioids == null &&
        addictions.quitPornography == null &&
        addictions.quitSmoking == null &&
        addictions.quitSocialMedia == null &&
        addictions.quitVaping == null)
      return;

    Permission.notification.request();
  }

  List<Widget> _buildSecuritySectionItems(
    BuildContext context,
    SettingsProvider settings,
  ) {
    return [
      _sectionHeader('Security', context),
      SwitchListTile(
        secondary: const Icon(Icons.lock),
        title: const Text('PIN lock'),
        subtitle: const Text('Require PIN to open app'),
        value: settings.isPinEnabled,
        onChanged: (value) async {
          if (value) {
            final pin = await _showSetPinDialog(context);
            if (pin != null) {
              await settings.setPinEnabled(true, pin);
            }
          } else {
            final confirmed = await _showVerifyPinDialog(context);
            if (confirmed) {
              await settings.setPinEnabled(false, null);
            }
          }
        },
      ),
      ListTile(
        leading: Icon(Icons.timer_outlined),
        title: TextField(
          controller: _pinTimeoutController,
          decoration: InputDecoration(
            labelText: 'PIN timeout (seconds)',
            hintText: '15',
          ),
          onChanged: (value) =>
              settings.setPinTimeout(int.tryParse(value) ?? 0),
        ),
      ),
    ];
  }

  Future<String?> _showSetPinDialog(BuildContext context) async {
    final controller = TextEditingController();
    final confirmController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set PIN'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              obscureText: true,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: 'Enter PIN',
                counterText: '',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmController,
              obscureText: true,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: 'Confirm PIN',
                counterText: '',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text == confirmController.text &&
                  controller.text.isNotEmpty) {
                Navigator.pop(context, controller.text);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('PINs do not match')),
                );
              }
            },
            child: const Text('Set'),
          ),
        ],
      ),
    );
  }

  Future<bool> _showVerifyPinDialog(BuildContext context) async {
    final controller = TextEditingController();

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter PIN'),
        content: TextField(
          controller: controller,
          obscureText: true,
          keyboardType: TextInputType.number,
          maxLength: 6,
          decoration: const InputDecoration(labelText: 'PIN', counterText: ''),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('OK'),
          ),
        ],
      ),
    );

    if (result == null || !context.mounted) return false;

    final settings = context.read<SettingsProvider>();
    return await settings.verifyPin(result);
  }

  List<Widget> _buildAppearanceSectionItems(
    BuildContext context,
    SettingsProvider settings,
  ) {
    return [
      _sectionHeader('Appearance', context),
      ListTile(
        leading: const Icon(Icons.brightness_6),
        title: const Text('Theme'),
        subtitle: Text(_getTheme(settings.themeMode)),
        onTap: () => _showThemeDialog(context, settings),
      ),
      const Divider(height: 1),
      ListTile(
        leading: const Icon(Icons.palette),
        title: const Text('Color scheme'),
        subtitle: Text(AppScheme.getName(settings.colorSchemeType)),
        onTap: () => _showColorDialog(context, settings),
      ),
      const Divider(height: 1),
      SwitchListTile(
        secondary: const Icon(Icons.restart_alt),
        title: const Text('Reset buttons'),
        subtitle: const Text('Show reset buttons on quit pages'),
        value: settings.showReset,
        onChanged: (value) => settings.showReset = value,
      ),
      const Divider(height: 1),
      SwitchListTile(
        secondary: const Icon(Icons.menu_book),
        title: const Text('Show journal'),
        subtitle: const Text(
          'Enable the journal tab for logging your thoughts',
        ),
        value: settings.showJournal,
        onChanged: (value) => settings.showJournal = value,
      ),
      if (defaultTargetPlatform == TargetPlatform.android) ...[
        const Divider(height: 1),
        SwitchListTile(
          secondary: const Icon(Icons.swipe),
          title: const Text('Swipe between tabs'),
          subtitle: const Text(
            'Dragging your finger moves between Journal, Homepage & Settings',
          ),
          value: settings.swipeTabs,
          onChanged: (value) => settings.swipeTabs = value,
        ),
      ],
    ];
  }

  List<Widget> _buildMainScreenItemsSectionItems(
    SettingsProvider settings,
    BuildContext context,
  ) {
    final items = [
      _ToggleItem(
        icon: Icons.local_bar,
        title: 'Alcohol',
        subtitle: 'Show alcohol tracking',
        value: settings.showAlcohol,
        onChanged: (value) => settings.showAlcohol = value,
      ),
      _ToggleItem(
        icon: Icons.air,
        title: 'Vaping',
        subtitle: 'Show vaping tracking',
        value: settings.showVaping,
        onChanged: (value) => settings.showVaping = value,
      ),
      _ToggleItem(
        icon: Icons.eco,
        title: 'Smoking',
        subtitle: 'Show smoking tracking',
        value: settings.showSmoking,
        onChanged: (value) => settings.showSmoking = value,
      ),
      _ToggleItem(
        icon: Icons.grass,
        title: 'Marijuana',
        subtitle: 'Show marijuana tracking',
        value: settings.showMarijuana,
        onChanged: (value) => settings.showMarijuana = value,
      ),
      _ToggleItem(
        icon: Icons.scatter_plot,
        title: 'Nicotine pouches',
        subtitle: 'Show nicotine pouches tracking',
        value: settings.showNicotinePouches,
        onChanged: (value) => settings.showNicotinePouches = value,
      ),
      _ToggleItem(
        icon: Icons.medication,
        title: 'Opioids',
        subtitle: 'Show opioids tracking',
        value: settings.showOpioids,
        onChanged: (value) => settings.showOpioids = value,
      ),
      _ToggleItem(
        icon: Icons.public,
        title: 'Social media',
        subtitle: 'Show social media tracking',
        value: settings.showSocialMedia,
        onChanged: (value) => settings.showSocialMedia = value,
      ),
      _ToggleItem(
        icon: Icons.block,
        title: 'AC',
        subtitle: 'Show adult content tracking',
        value: settings.showPornography,
        onChanged: (value) => settings.showPornography = value,
      ),
    ];

    return [
      _sectionHeader('Main Screen Items', context),
      ..._buildToggleList(items),
    ];
  }

  List<Widget> _buildNotificationsSectionItems(
    BuildContext context,
    SettingsProvider settings,
  ) {
    final notificationItems = [
      _ToggleItem(
        icon: Icons.local_bar,
        title: 'Alcohol',
        subtitle: 'Notify alcohol quitting progress',
        value: settings.notifyAlcohol,
        onChanged: (value) => settings.notifyAlcohol = value,
      ),
      _ToggleItem(
        icon: Icons.air,
        title: 'Vaping',
        subtitle: 'Notify vaping quitting progress',
        value: settings.notifyVaping,
        onChanged: (value) => settings.notifyVaping = value,
      ),
      _ToggleItem(
        icon: Icons.eco,
        title: 'Smoking',
        subtitle: 'Notify smoking quitting progress',
        value: settings.notifySmoking,
        onChanged: (value) => settings.notifySmoking = value,
      ),
      _ToggleItem(
        icon: Icons.grass,
        title: 'Marijuana',
        subtitle: 'Notify marijuana quitting progress',
        value: settings.notifyMarijuana,
        onChanged: (value) => settings.notifyMarijuana = value,
      ),
      _ToggleItem(
        icon: Icons.scatter_plot,
        title: 'Nicotine pouches',
        subtitle: 'Notify nicotine pouches quitting progress',
        value: settings.notifyPouches,
        onChanged: (value) => settings.notifyPouches = value,
      ),
      _ToggleItem(
        icon: Icons.medication,
        title: 'Opioids',
        subtitle: 'Notify opioids quitting progress',
        value: settings.notifyOpioids,
        onChanged: (value) => settings.notifyOpioids = value,
      ),
      _ToggleItem(
        icon: Icons.public,
        title: 'Social media',
        subtitle: 'Notify social media quitting progress',
        value: settings.notifySocialMedia,
        onChanged: (value) => settings.notifySocialMedia = value,
      ),
      _ToggleItem(
        icon: Icons.block,
        title: 'Adult content',
        subtitle: 'Notify adult content quitting progress',
        value: settings.notifyPornography,
        onChanged: (value) => settings.notifyPornography = value,
      ),
      _ToggleItem(
        icon: Icons.reset_tv,
        title: 'Reset messages',
        subtitle: 'Show positive reinforcement after relapses',
        value: settings.notifyRelapse,
        onChanged: (value) => settings.notifyRelapse = value,
      ),
    ];

    return [
      _sectionHeader('Notifications', context),
      ListTile(
        leading: const Icon(Icons.schedule),
        title: const Text('Notification frequency'),
        subtitle: Text(
          'Every ${settings.notifyEvery} day(s) at ${getTimeString(settings.notifyAt)}',
        ),
        onTap: () => _showNotificationFrequencyDialog(context, settings),
      ),
      const Divider(height: 1),
      ..._buildToggleList(notificationItems),
    ];
  }

  void _deleteEverything(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete everything'),
        content: const Text(
          'Are you sure you delete everything? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final prefs = await SharedPreferences.getInstance();
              prefs.clear();
            },
            child: const Text('DELETE!'),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSystemSectionItems(
    BuildContext context,
    SettingsProvider settings,
  ) {
    return [
      _sectionHeader('System', context),
      ListTile(
        title: const Text("About"),
        leading: const Icon(Icons.info_outline),
        onTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const AboutPage())),
      ),
      const Divider(height: 1),
      ListTile(
        title: const Text("What's new"),
        leading: const Icon(Icons.change_circle_outlined),
        onTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const WhatsNew())),
      ),
      const Divider(height: 1),
      ListTile(
        title: const Text("Enjoying the app?"),
        leading: const Icon(Icons.favorite_outline),
        onTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const EnjoyingPage())),
      ),
      const Divider(height: 1),
      ListTile(
        title: const Text("Report a bug"),
        leading: const Icon(Icons.bug_report),
        onTap: () async {
          final info = await PackageInfo.fromPlatform();
          launchUrlString(
            "https://github.com/brandonp2412/Quitter/issues/new?body=App version: ${info.version}",
          );
        },
      ),
      const Divider(height: 1),
      ListTile(
        title: const Text("Export data"),
        leading: const Icon(Icons.upload_file),
        onTap: () => _exportData(context),
      ),
      const Divider(height: 1),
      ListTile(
        title: const Text("Import data"),
        leading: const Icon(Icons.file_download),
        onTap: () => _importData(context),
      ),
      const Divider(height: 1),
      const Divider(height: 1),
      ListTile(
        title: const Text("Delete everything"),
        leading: const Icon(Icons.delete),
        onTap: () => _deleteEverything(context),
      ),
    ];
  }

  List<Widget> _buildAllSettingsItems(
    BuildContext context,
    SettingsProvider settings,
  ) {
    return [
      ..._buildAppearanceSectionItems(context, settings),
      const SizedBox(height: 24),
      ..._buildSecuritySectionItems(context, settings),
      const SizedBox(height: 24),
      ..._buildMainScreenItemsSectionItems(settings, context),
      const SizedBox(height: 24),
      ..._buildNotificationsSectionItems(context, settings),
      const SizedBox(height: 24),
      ..._buildSystemSectionItems(context, settings),
    ];
  }

  bool _matchesSearch(Widget item, String query) {
    if (query.isEmpty) return true;

    final lowerCaseQuery = query.toLowerCase();

    if (item is Padding && item.child is Text) {
      final text = item.child as Text;
      if (text.data != null &&
          text.data!.toLowerCase().contains(lowerCaseQuery)) {
        return true;
      }
    } else if (item is ListTile) {
      final title = (item.title as Text).data?.toLowerCase() ?? '';
      final subtitle = (item.subtitle as Text?)?.data?.toLowerCase() ?? '';
      if (title.contains(lowerCaseQuery) || subtitle.contains(lowerCaseQuery)) {
        return true;
      }
    } else if (item is SwitchListTile) {
      final title = (item.title as Text).data?.toLowerCase() ?? '';
      final subtitle = (item.subtitle as Text?)?.data?.toLowerCase() ?? '';
      if (title.contains(lowerCaseQuery) || subtitle.contains(lowerCaseQuery)) {
        return true;
      }
    }
    return false;
  }

  Widget _sectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
    );
  }

  String _getTheme(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return 'Light';
      case AppThemeMode.dark:
        return 'Dark';
      case AppThemeMode.system:
        return 'System';
      case AppThemeMode.pureBlack:
        return 'Pure black';
    }
  }

  void _showThemeDialog(BuildContext context, SettingsProvider settings) {
    _showSelectionDialog<AppThemeMode>(
      context: context,
      title: 'Theme mode',
      currentValue: settings.themeMode,
      options: AppThemeMode.values,
      getDisplayName: _getTheme,
      onChanged: (value) => settings.themeMode = value,
    );
  }

  void _showColorDialog(BuildContext context, SettingsProvider settings) {
    _showSelectionDialog<ColorSchemeType>(
      context: context,
      title: 'Color scheme',
      currentValue: settings.colorSchemeType,
      options: ColorSchemeType.values,
      getDisplayName: AppScheme.getName,
      onChanged: (value) => settings.colorSchemeType = value,
    );
  }

  void _showSelectionDialog<T>({
    required BuildContext context,
    required String title,
    required T currentValue,
    required List<T> options,
    required String Function(T) getDisplayName,
    required void Function(T) onChanged,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: RadioGroup<T>(
            groupValue: currentValue,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
                Navigator.pop(context);
              }
            },
            child: Column(
              children: options.map((option) {
                return RadioListTile<T>(
                  title: Text(getDisplayName(option)),
                  value: option,
                  selected: currentValue == option,
                );
              }).toList(),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showNotificationFrequencyDialog(
    BuildContext context,
    SettingsProvider settings,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        final everyCtrl = TextEditingController(
          text: settings.notifyEvery.toString(),
        );

        final atCtrl = TextEditingController(
          text: getTimeString(settings.notifyAt),
        );

        return AlertDialog(
          title: const Text('Notification frequency'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: everyCtrl,
                  keyboardType: TextInputType.number,
                  onTap: () => selectAll(everyCtrl),
                  decoration: const InputDecoration(
                    labelText: 'Notify every',
                    suffixText: 'day(s)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: atCtrl,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'At',
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                  onTap: () async {
                    final hours = settings.notifyAt ~/ 60;
                    final minutes = settings.notifyAt % 60;
                    final result = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: hours, minute: minutes),
                    );

                    if (result != null) {
                      final totalMinutes = result.hour * 60 + result.minute;
                      atCtrl.text = getTimeString(totalMinutes);
                      settings.notifyAt = totalMinutes;
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final days = int.tryParse(everyCtrl.text);
                if (days != null && days > 0) {
                  settings.notifyEvery = days;
                  await testNotification(
                    title: 'Positive affirmation',
                    body:
                        'You will see a notification like this every $days day${days > 0 ? 's' : ''} congratulating you on your progress!',
                  );
                  if (context.mounted) Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildToggleList(List<_ToggleItem> items) {
    final List<Widget> widgets = [];

    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      widgets.add(
        SwitchListTile(
          secondary: Icon(item.icon),
          title: Text(item.title),
          subtitle: Text(item.subtitle),
          value: item.value,
          onChanged: (value) => item.onChanged(value),
        ),
      );

      if (i < items.length - 1) {
        widgets.add(const Divider(height: 1));
      }
    }

    return widgets;
  }
}

class _ToggleItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool) onChanged;

  const _ToggleItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });
}
