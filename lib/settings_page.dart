import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/color_scheme_helper.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/settings_provider.dart';

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
              _buildSectionHeader('Appearance'),
              const SizedBox(height: 8),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.brightness_6),
                  title: const Text('Theme'),
                  subtitle: Text(_getThemeModeText(settings.themeMode)),
                  onTap: () => _showThemeModeDialog(context, settings),
                ),
              ),

              const SizedBox(height: 8),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.palette),
                  title: const Text('Color Scheme'),
                  subtitle: Text(
                    ColorSchemeHelper.getColorSchemeName(
                      settings.colorSchemeType,
                    ),
                  ),
                  onTap: () => _showColorSchemeDialog(context, settings),
                ),
              ),

              const SizedBox(height: 24),

              _buildSectionHeader('Main Screen Items'),
              const SizedBox(height: 8),

              Card(
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('Alcohol'),
                      subtitle: const Text('Show alcohol tracking'),
                      value: settings.showAlcohol,
                      onChanged: (value) =>
                          settings.setShowAlcohol(value ?? false),
                    ),
                    const Divider(height: 1),
                    CheckboxListTile(
                      title: const Text('Vaping'),
                      subtitle: const Text('Show vaping tracking'),
                      value: settings.showVaping,
                      onChanged: (value) =>
                          settings.setShowVaping(value ?? false),
                    ),
                    const Divider(height: 1),
                    CheckboxListTile(
                      title: const Text('Smoking'),
                      subtitle: const Text('Show smoking tracking'),
                      value: settings.showSmoking,
                      onChanged: (value) =>
                          settings.setShowSmoking(value ?? false),
                    ),
                    const Divider(height: 1),
                    CheckboxListTile(
                      title: const Text('Opioids'),
                      subtitle: const Text('Show opioids tracking'),
                      value: settings.showOpioids,
                      onChanged: (value) =>
                          settings.setShowOpioids(value ?? false),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }

  String _getThemeModeText(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  void _showThemeModeDialog(BuildContext context, SettingsProvider settings) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Theme Mode'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ThemeMode.values.map((mode) {
            return RadioListTile<ThemeMode>(
              title: Text(_getThemeModeText(mode)),
              value: mode,
              groupValue: settings.themeMode,
              onChanged: (value) {
                if (value != null) {
                  settings.setThemeMode(value);
                  Navigator.pop(context);
                }
              },
              selected: settings.themeMode == mode,
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

  void _showColorSchemeDialog(BuildContext context, SettingsProvider settings) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Color Scheme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ColorSchemeType.values.map((type) {
            return RadioListTile<ColorSchemeType>(
              title: Text(ColorSchemeHelper.getColorSchemeName(type)),
              value: type,
              groupValue: settings.colorSchemeType,
              onChanged: (value) {
                if (value != null) {
                  settings.setColorSchemeType(value);
                  Navigator.pop(context);
                }
              },
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
}
