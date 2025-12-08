import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Consumer<SettingsProvider>(
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
                  hintText: l10n.settingsSearchHint,
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
    );
  }

  Future<void> _exportData(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {};
    for (String key in prefs.getKeys()) {
      data[key] = prefs.get(key);
    }

    final json = jsonEncode(data);
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    final path = await FilePicker.platform.saveFile(
      dialogTitle: 'Save data to',
      fileName: 'quitter-$timestamp.json',
      type: FileType.custom,
      allowedExtensions: ['json'],
      bytes: Uint8List.fromList(json.codeUnits),
    );

    if (defaultTargetPlatform == TargetPlatform.linux) {
      final file = File(path!);
      await file.writeAsString(json);
    }

    if (!context.mounted || path == null) return;
    toast(l10n.dataExported);
  }

  Future<void> _importData(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
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
    toast(l10n.dataImported);

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
    final l10n = AppLocalizations.of(context)!;
    return [
      _sectionHeader(l10n.settingsSectionSecurity, context),
      SwitchListTile(
        secondary: const Icon(Icons.lock),
        title: Text(l10n.settingsPinLock),
        subtitle: Text(l10n.settingsPinLockSubtitle),
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
            labelText: l10n.settingsPinTimeout,
            hintText: l10n.settingsPinTimeoutHint,
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
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.pinDialogSetTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  labelText: l10n.pinDialogEnterPIN,
                  counterText: '',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: confirmController,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  labelText: l10n.pinDialogConfirmPIN,
                  counterText: '',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () {
                if (controller.text == confirmController.text &&
                    controller.text.isNotEmpty) {
                  Navigator.pop(context, controller.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.pinDialogPINsDoNotMatch)),
                  );
                }
              },
              child: Text(l10n.pinDialogSet),
            ),
          ],
        );
      },
    );
  }

  Future<bool> _showVerifyPinDialog(BuildContext context) async {
    final controller = TextEditingController();

    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.pinDialogEnterPIN),
          content: TextField(
            controller: controller,
            obscureText: true,
            keyboardType: TextInputType.number,
            maxLength: 6,
            decoration: InputDecoration(
              labelText: l10n.pinDialogPIN,
              counterText: '',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: Text(l10n.pinDialogOK),
            ),
          ],
        );
      },
    );

    if (result == null || !context.mounted) return false;

    final settings = context.read<SettingsProvider>();
    return await settings.verifyPin(result);
  }

  List<Widget> _buildAppearanceSectionItems(
    BuildContext context,
    SettingsProvider settings,
  ) {
    final l10n = AppLocalizations.of(context)!;
    return [
      _sectionHeader(l10n.settingsSectionAppearance, context),
      ListTile(
        leading: const Icon(Icons.brightness_6),
        title: Text(l10n.settingsTheme),
        subtitle: Text(_getTheme(settings.themeMode, context)),
        onTap: () => _showThemeDialog(context, settings),
      ),
      const Divider(height: 1),
      ListTile(
        leading: const Icon(Icons.palette),
        title: Text(l10n.settingsColorScheme),
        subtitle: Text(AppScheme.getName(settings.colorSchemeType, l10n)),
        onTap: () => _showColorDialog(context, settings),
      ),
      const Divider(height: 1),
      ListTile(
        leading: const Icon(Icons.language),
        title: Text(l10n.settingsLocale),
        subtitle: Text(settings.locale),
        onTap: () => _showLocaleDialog(context, settings),
      ),
      const Divider(height: 1),
      SwitchListTile(
        secondary: const Icon(Icons.restart_alt),
        title: Text(l10n.settingsResetButtons),
        subtitle: Text(l10n.settingsResetButtonsSubtitle),
        value: settings.showReset,
        onChanged: (value) => settings.showReset = value,
      ),
      const Divider(height: 1),
      SwitchListTile(
        secondary: const Icon(Icons.menu_book),
        title: Text(l10n.settingsShowJournal),
        subtitle: Text(l10n.settingsShowJournalSubtitle),
        value: settings.showJournal,
        onChanged: (value) => settings.showJournal = value,
      ),
      if (defaultTargetPlatform == TargetPlatform.android) ...[
        const Divider(height: 1),
        SwitchListTile(
          secondary: const Icon(Icons.swipe),
          title: Text(l10n.settingsSwipeBetweenTabs),
          subtitle: Text(l10n.settingsSwipeBetweenTabsSubtitle),
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
    final l10n = AppLocalizations.of(context)!;
    final items = [
      _ToggleItem(
        icon: Icons.local_bar,
        title: l10n.addictionAlcohol,
        subtitle: l10n.settingsShowAlcoholTracking,
        value: settings.showAlcohol,
        onChanged: (value) => settings.showAlcohol = value,
      ),
      _ToggleItem(
        icon: Icons.air,
        title: l10n.addictionVaping,
        subtitle: l10n.settingsShowVapingTracking,
        value: settings.showVaping,
        onChanged: (value) => settings.showVaping = value,
      ),
      _ToggleItem(
        icon: Icons.eco,
        title: l10n.addictionSmoking,
        subtitle: l10n.settingsShowSmokingTracking,
        value: settings.showSmoking,
        onChanged: (value) => settings.showSmoking = value,
      ),
      _ToggleItem(
        icon: Icons.grass,
        title: l10n.addictionMarijuana,
        subtitle: l10n.settingsShowMarijuanaTracking,
        value: settings.showMarijuana,
        onChanged: (value) => settings.showMarijuana = value,
      ),
      _ToggleItem(
        icon: Icons.scatter_plot,
        title: l10n.addictionNicotinePouches,
        subtitle: l10n.settingsShowNicotinePouchesTracking,
        value: settings.showNicotinePouches,
        onChanged: (value) => settings.showNicotinePouches = value,
      ),
      _ToggleItem(
        icon: Icons.medication,
        title: l10n.addictionOpioids,
        subtitle: l10n.settingsShowOpioidsTracking,
        value: settings.showOpioids,
        onChanged: (value) => settings.showOpioids = value,
      ),
      _ToggleItem(
        icon: Icons.public,
        title: l10n.addictionSocialMedia,
        subtitle: l10n.settingsShowSocialMediaTracking,
        value: settings.showSocialMedia,
        onChanged: (value) => settings.showSocialMedia = value,
      ),
      _ToggleItem(
        icon: Icons.block,
        title: l10n.addictionAC,
        subtitle: l10n.settingsShowAdultContentTracking,
        value: settings.showPornography,
        onChanged: (value) => settings.showPornography = value,
      ),
    ];

    return [
      _sectionHeader(l10n.settingsSectionMainScreenItems, context),
      ..._buildToggleList(items),
    ];
  }

  List<Widget> _buildNotificationsSectionItems(
    BuildContext context,
    SettingsProvider settings,
  ) {
    final l10n = AppLocalizations.of(context)!;
    final notificationItems = [
      _ToggleItem(
        icon: Icons.local_bar,
        title: l10n.addictionAlcohol,
        subtitle: l10n.settingsNotifyAlcohol,
        value: settings.notifyAlcohol,
        onChanged: (value) => settings.notifyAlcohol = value,
      ),
      _ToggleItem(
        icon: Icons.air,
        title: l10n.addictionVaping,
        subtitle: l10n.settingsNotifyVaping,
        value: settings.notifyVaping,
        onChanged: (value) => settings.notifyVaping = value,
      ),
      _ToggleItem(
        icon: Icons.eco,
        title: l10n.addictionSmoking,
        subtitle: l10n.settingsNotifySmoking,
        value: settings.notifySmoking,
        onChanged: (value) => settings.notifySmoking = value,
      ),
      _ToggleItem(
        icon: Icons.grass,
        title: l10n.addictionMarijuana,
        subtitle: l10n.settingsNotifyMarijuana,
        value: settings.notifyMarijuana,
        onChanged: (value) => settings.notifyMarijuana = value,
      ),
      _ToggleItem(
        icon: Icons.scatter_plot,
        title: l10n.addictionNicotinePouches,
        subtitle: l10n.settingsNotifyNicotinePouches,
        value: settings.notifyPouches,
        onChanged: (value) => settings.notifyPouches = value,
      ),
      _ToggleItem(
        icon: Icons.medication,
        title: l10n.addictionOpioids,
        subtitle: l10n.settingsNotifyOpioids,
        value: settings.notifyOpioids,
        onChanged: (value) => settings.notifyOpioids = value,
      ),
      _ToggleItem(
        icon: Icons.public,
        title: l10n.addictionSocialMedia,
        subtitle: l10n.settingsNotifySocialMedia,
        value: settings.notifySocialMedia,
        onChanged: (value) => settings.notifySocialMedia = value,
      ),
      _ToggleItem(
        icon: Icons.block,
        title: l10n.addictionAdultContent,
        subtitle: l10n.settingsNotifyAdultContent,
        value: settings.notifyPornography,
        onChanged: (value) => settings.notifyPornography = value,
      ),
      _ToggleItem(
        icon: Icons.reset_tv,
        title: l10n.settingsResetMessages,
        subtitle: l10n.settingsResetMessagesSubtitle,
        value: settings.notifyRelapse,
        onChanged: (value) => settings.notifyRelapse = value,
      ),
    ];

    return [
      _sectionHeader(l10n.settingsSectionNotifications, context),
      ListTile(
        leading: const Icon(Icons.schedule),
        title: Text(l10n.settingsNotificationFrequency),
        subtitle: Text(
          l10n.settingsNotificationFrequencySubtitle(
            settings.notifyEvery,
            getTimeString(settings.notifyAt),
          ),
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
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.settingsDeleteEverything),
          content: Text(l10n.deleteEverythingDialogMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
              },
              child: Text(l10n.deleteEverythingConfirm),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildSystemSectionItems(
    BuildContext context,
    SettingsProvider settings,
  ) {
    final l10n = AppLocalizations.of(context)!;
    return [
      _sectionHeader(l10n.settingsSectionSystem, context),
      ListTile(
        title: Text(l10n.settingsAbout),
        leading: const Icon(Icons.info_outline),
        onTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const AboutPage())),
      ),
      const Divider(height: 1),
      ListTile(
        title: Text(l10n.settingsWhatsNew),
        leading: const Icon(Icons.change_circle_outlined),
        onTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const WhatsNew())),
      ),
      const Divider(height: 1),
      ListTile(
        title: Text(l10n.settingsEnjoyingApp),
        leading: const Icon(Icons.favorite_outline),
        onTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const EnjoyingPage())),
      ),
      const Divider(height: 1),
      ListTile(
        title: Text(l10n.settingsReportBug),
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
        title: Text(l10n.settingsExportData),
        leading: const Icon(Icons.upload_file),
        onTap: () => _exportData(context),
      ),
      const Divider(height: 1),
      ListTile(
        title: Text(l10n.settingsImportData),
        leading: const Icon(Icons.file_download),
        onTap: () => _importData(context),
      ),
      const Divider(height: 1),
      const Divider(height: 1),
      ListTile(
        title: Text(l10n.settingsDeleteEverything),
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
    } else if (item is ListTile && item.title is TextField) {
      final title =
          (item.title as TextField).decoration?.labelText?.toLowerCase() ?? '';
      final subtitle = (item.subtitle as Text?)?.data?.toLowerCase() ?? '';
      if (title.contains(lowerCaseQuery) || subtitle.contains(lowerCaseQuery)) {
        return true;
      }
    } else if (item is ListTile && item.title is Text) {
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

  String _getTheme(AppThemeMode mode, BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (mode) {
      case AppThemeMode.light:
        return l10n.themeLight;
      case AppThemeMode.dark:
        return l10n.themeDark;
      case AppThemeMode.system:
        return l10n.themeSystem;
      case AppThemeMode.pureBlack:
        return l10n.themePureBlack;
    }
  }

  void _showThemeDialog(BuildContext context, SettingsProvider settings) {
    final l10n = AppLocalizations.of(context)!;
    _showSelectionDialog<AppThemeMode>(
      context: context,
      title: l10n.themeMode,
      currentValue: settings.themeMode,
      options: AppThemeMode.values,
      getDisplayName: (mode) => _getTheme(mode, context),
      onChanged: (value) => settings.themeMode = value,
    );
  }

  void _showLocaleDialog(BuildContext context, SettingsProvider settings) {
    final l10n = AppLocalizations.of(context)!;
    _showSelectionDialog<String?>(
      context: context,
      title: l10n.settingsLocale,
      currentValue: settings.locale,
      options: ['system', 'en', 'ja', 'zh'],
      getDisplayName: (value) {
        if (value == 'system')
          return l10n.settingsLocaleSystem;
        else if (value == 'en')
          return l10n.settingsLocaleEnglish;
        else if (value == 'ja')
          return l10n.settingsLocaleJapanese;
        else if (value == 'zh')
          return l10n.settingsLocaleSimplifiedChinese;
        return l10n.settingsLocaleUnsupported;
      },
      onChanged: (value) => settings.locale = value ?? 'system',
    );
  }

  void _showColorDialog(BuildContext context, SettingsProvider settings) {
    final l10n = AppLocalizations.of(context)!;
    _showSelectionDialog<ColorSchemeType>(
      context: context,
      title: l10n.settingsColorScheme,
      currentValue: settings.colorSchemeType,
      options: ColorSchemeType.values,
      getDisplayName: (type) => AppScheme.getName(type, l10n),
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
    final l10n = AppLocalizations.of(context)!;
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
            child: Text(l10n.cancel),
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
        final l10n = AppLocalizations.of(context)!;
        final everyCtrl = TextEditingController(
          text: settings.notifyEvery.toString(),
        );

        final atCtrl = TextEditingController(
          text: getTimeString(settings.notifyAt),
        );

        return AlertDialog(
          title: Text(l10n.settingsNotificationFrequency),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: everyCtrl,
                  keyboardType: TextInputType.number,
                  onTap: () => selectAll(everyCtrl),
                  decoration: InputDecoration(
                    labelText: l10n.notificationFrequencyNotifyEvery,
                    suffixText: l10n.notificationFrequencyDays,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: atCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: l10n.notificationFrequencyAt,
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
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () async {
                final days = int.tryParse(everyCtrl.text);
                if (days != null && days > 0) {
                  settings.notifyEvery = days;
                  await testNotification(
                    title: l10n.notificationTestTitle,
                    body: l10n.notificationTestBody(days, days > 1 ? 's' : ''),
                  );
                  if (context.mounted) Navigator.pop(context);
                }
              },
              child: Text(l10n.notificationFrequencySave),
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
