import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart' show Consumer, ReadContext;
import 'package:quitter/about_page.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/app_scheme.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/enjoying_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/radio_group.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/whats_new.dart';
import 'dart:typed_data';
import 'package:quitter/app_theme_mode.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  String _searchQuery = '';
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
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

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _searchFocusNode.unfocus();
      } else {
        _searchFocusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Search settings...',
                  border: InputBorder.none,
                ),
              )
            : const Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
        ],
      ),
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

            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: filteredItems,
            );
          },
        ),
      ),
    );
  }

  Future<void> _exportData(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs
          .getKeys()
          .map((key) => '$key=${prefs.get(key)}')
          .join('\n');

      final path = await FilePicker.platform.saveFile(
        dialogTitle: 'Save data to',
        fileName: 'quitter.txt',
        type: FileType.custom,
        allowedExtensions: ['txt'],
        bytes: Uint8List.fromList(data.codeUnits),
      );

      if (!context.mounted || path == null) return;
      toast(context, 'Data exported!');
    } catch (e) {
      if (!mounted) return;
      toast(
        context,
        'Error exporting data: $e',
        duration: const Duration(seconds: 10),
      );
    }
  }

  Future<void> _importData(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );
      if (result == null) return;

      File file = File(result.files.single.path!);
      String contents = await file.readAsString();

      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      for (var line in contents.split('\n')) {
        if (line.isEmpty) continue;

        final parts = line.split('=');
        if (parts.length < 2) continue;

        final key = parts[0];
        final value = parts.sublist(1).join('=');

        if (value == 'true' || value == 'false') {
          await prefs.setBool(key, value == 'true');
        } else if (int.tryParse(value) != null) {
          await prefs.setInt(key, int.parse(value));
        } else if (double.tryParse(value) != null) {
          await prefs.setDouble(key, double.parse(value));
        } else {
          await prefs.setString(key, value);
        }
      }

      if (!context.mounted) return;
      toast(context, 'Data imported successfully!');

      final addictions = context.read<AddictionProvider>();
      await addictions.loadAddictions();
      if (!context.mounted) return;

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
    } catch (error) {
      if (!mounted) return;
      toast(
        context,
        'Error importing data: $error',
        duration: const Duration(seconds: 10),
      );
    }
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
        title: const Text('Color Scheme'),
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
        title: 'Social Media',
        subtitle: 'Show social media tracking',
        value: settings.showSocialMedia,
        onChanged: (value) => settings.showSocialMedia = value,
      ),
      _ToggleItem(
        icon: Icons.block,
        title: 'Pornography',
        subtitle: 'Show pornography tracking',
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
        title: 'Social Media',
        subtitle: 'Notify social media quitting progress',
        value: settings.notifySocialMedia,
        onChanged: (value) => settings.notifySocialMedia = value,
      ),
      _ToggleItem(
        icon: Icons.block,
        title: 'Pornography',
        subtitle: 'Notify pornography quitting progress',
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
        title: const Text('Notification Frequency'),
        subtitle: Text(
          'Every ${settings.notifyEvery} day(s) at ${getTimeString(settings.notifyAt)}',
        ),
        onTap: () => _showNotificationFrequencyDialog(context, settings),
      ),
      const Divider(height: 1),
      ..._buildToggleList(notificationItems),
    ];
  }

  void _clearHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear History'),
        content: const Text(
          'Are you sure you want to clear all quitting history? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              final addictions = context.read<AddictionProvider>();
              addictions.clearDays();
            },
            child: const Text('Clear'),
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
      ListTile(
        title: const Text("Clear history"),
        leading: const Icon(Icons.delete),
        onTap: () => _clearHistory(context),
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
        return 'Pure Black';
    }
  }

  void _showThemeDialog(BuildContext context, SettingsProvider settings) {
    _showSelectionDialog<AppThemeMode>(
      context: context,
      title: 'Theme Mode',
      currentValue: settings.themeMode,
      options: AppThemeMode.values,
      getDisplayName: _getTheme,
      onChanged: (value) => settings.themeMode = value,
    );
  }

  void _showColorDialog(BuildContext context, SettingsProvider settings) {
    _showSelectionDialog<ColorSchemeType>(
      context: context,
      title: 'Color Scheme',
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
        content: AppRadioGroup<T>(
          value: currentValue,
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
              Navigator.pop(context);
            }
          },
          children: options.map((option) {
            return RadioListTile<T>(
              title: Text(getDisplayName(option)),
              value: option,
              groupValue: currentValue,
              onChanged: (value) {},
              selected: currentValue == option,
            );
          }).toList(),
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
              onPressed: () {
                final days = int.tryParse(everyCtrl.text);
                if (days != null && days > 0) {
                  settings.notifyEvery = days;
                  Navigator.pop(context);
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
