import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Consumer;
import 'package:quitter/about_page.dart';
import 'package:quitter/color_scheme_helper.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/radio_group.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildAppearanceSection(context, settings),
              const SizedBox(height: 24),
              _buildMainScreenItemsSection(settings, context),
              const SizedBox(height: 24),
              _buildNotificationsSection(context, settings),
              const SizedBox(height: 24),
              Card(
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.info_outline),
                  onTap: () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => AboutPage())),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAppearanceSection(
    BuildContext context,
    SettingsProvider settings,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Appearance', context),
        const SizedBox(height: 8),
        Card(
          child: Column(
            children: [
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
                subtitle: Text(
                  ColorSchemeHelper.getColorSchemeName(
                    settings.colorSchemeType,
                  ),
                ),
                onTap: () => _showColorDialog(context, settings),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainScreenItemsSection(SettingsProvider settings, context) {
    final items = [
      _ToggleItem(
        icon: Icons.local_bar,
        title: 'Alcohol',
        subtitle: 'Show alcohol tracking',
        value: settings.showAlcohol,
        onChanged: settings.setShowAlcohol,
      ),
      _ToggleItem(
        icon: Icons.air,
        title: 'Vaping',
        subtitle: 'Show vaping tracking',
        value: settings.showVaping,
        onChanged: settings.setShowVaping,
      ),
      _ToggleItem(
        icon: Icons.eco,
        title: 'Smoking',
        subtitle: 'Show smoking tracking',
        value: settings.showSmoking,
        onChanged: settings.setShowSmoking,
      ),
      _ToggleItem(
        icon: Icons.scatter_plot,
        title: 'Nicotine pouches',
        subtitle: 'Show nicotine pouches tracking',
        value: settings.showNicotinePouches,
        onChanged: settings.setShowNicotinePouches,
      ),
      _ToggleItem(
        icon: Icons.medication,
        title: 'Opioids',
        subtitle: 'Show opioids tracking',
        value: settings.showOpioids,
        onChanged: settings.setShowOpioids,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Main Screen Items', context),
        const SizedBox(height: 8),
        Card(child: Column(children: _buildToggleList(items))),
      ],
    );
  }

  Widget _buildNotificationsSection(
    BuildContext context,
    SettingsProvider settings,
  ) {
    final notificationItems = [
      _ToggleItem(
        icon: Icons.local_bar,
        title: 'Alcohol',
        subtitle: 'Notify alcohol quitting progress',
        value: settings.notifyAlcohol,
        onChanged: settings.setNotifyAlcohol,
      ),
      _ToggleItem(
        icon: Icons.air,
        title: 'Vaping',
        subtitle: 'Notify vaping quitting progress',
        value: settings.notifyVaping,
        onChanged: settings.setNotifyVaping,
      ),
      _ToggleItem(
        icon: Icons.eco,
        title: 'Smoking',
        subtitle: 'Notify smoking quitting progress',
        value: settings.notifySmoking,
        onChanged: settings.setNotifySmoking,
      ),
      _ToggleItem(
        icon: Icons.scatter_plot,
        title: 'Nicotine pouches',
        subtitle: 'Notify nicotine pouches quitting progress',
        value: settings.notifyPouches,
        onChanged: settings.setNotifyPouches,
      ),
      _ToggleItem(
        icon: Icons.medication,
        title: 'Opioids',
        subtitle: 'Notify opioids quitting progress',
        value: settings.notifyOpioids,
        onChanged: settings.setNotifyOpioids,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Notifications', context),
        const SizedBox(height: 8),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text('Notification Frequency'),
                subtitle: Text('Every ${settings.notifyEvery} day(s)'),
                onTap: () =>
                    _showNotificationFrequencyDialog(context, settings),
              ),
              const Divider(height: 1),
              ..._buildToggleList(notificationItems),
            ],
          ),
        ),
      ],
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

      // Add divider between items (but not after the last one)
      if (i < items.length - 1) {
        widgets.add(const Divider(height: 1));
      }
    }

    return widgets;
  }

  Widget _sectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
    );
  }

  String _getTheme(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  void _showThemeDialog(BuildContext context, SettingsProvider settings) {
    _showSelectionDialog<ThemeMode>(
      context: context,
      title: 'Theme Mode',
      currentValue: settings.themeMode,
      options: ThemeMode.values,
      getDisplayName: _getTheme,
      onChanged: settings.setThemeMode,
    );
  }

  void _showColorDialog(BuildContext context, SettingsProvider settings) {
    _showSelectionDialog<ColorSchemeType>(
      context: context,
      title: 'Color Scheme',
      currentValue: settings.colorSchemeType,
      options: ColorSchemeType.values,
      getDisplayName: ColorSchemeHelper.getColorSchemeName,
      onChanged: settings.setColorSchemeType,
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
              onChanged: (value) {}, // Handled by RadioGroup
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
        final controller = TextEditingController(
          text: settings.notifyEvery.toString(),
        );

        return AlertDialog(
          title: const Text('Notification Frequency'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Notify every',
              suffixText: 'day(s)',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final days = int.tryParse(controller.text);
                if (days != null && days > 0) {
                  settings.setNotifyEvery(days);
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
