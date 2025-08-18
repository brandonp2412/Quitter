import 'package:flutter/material.dart' as flutter_material;
import 'package:provider/provider.dart' show Consumer;
import 'package:quitter/color_scheme_helper.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/radio_group.dart';

class SettingsPage extends flutter_material.StatelessWidget {
  const SettingsPage({super.key});

  @override
  flutter_material.Widget build(flutter_material.BuildContext context) {
    return flutter_material.Scaffold(
      appBar: flutter_material.AppBar(
        title: const flutter_material.Text('Settings'),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          return flutter_material.ListView(
            padding: const flutter_material.EdgeInsets.all(16.0),
            children: [
              _buildSectionHeader('Appearance'),
              const flutter_material.SizedBox(height: 8),

              flutter_material.Card(
                child: flutter_material.ListTile(
                  leading: const flutter_material.Icon(
                    flutter_material.Icons.brightness_6,
                  ),
                  title: const flutter_material.Text('Theme'),
                  subtitle: flutter_material.Text(
                    _getThemeModeText(settings.themeMode),
                  ),
                  onTap: () => _showThemeModeDialog(context, settings),
                ),
              ),

              const flutter_material.SizedBox(height: 8),

              flutter_material.Card(
                child: flutter_material.ListTile(
                  leading: const flutter_material.Icon(
                    flutter_material.Icons.palette,
                  ),
                  title: const flutter_material.Text('Color Scheme'),
                  subtitle: flutter_material.Text(
                    ColorSchemeHelper.getColorSchemeName(
                      settings.colorSchemeType,
                    ),
                  ),
                  onTap: () => _showColorSchemeDialog(context, settings),
                ),
              ),

              const flutter_material.SizedBox(height: 24),

              _buildSectionHeader('Main Screen Items'),
              const flutter_material.SizedBox(height: 8),

              flutter_material.Card(
                child: flutter_material.Column(
                  children: [
                    flutter_material.CheckboxListTile(
                      title: const flutter_material.Text('Alcohol'),
                      subtitle: const flutter_material.Text(
                        'Show alcohol tracking',
                      ),
                      value: settings.showAlcohol,
                      onChanged: (value) =>
                          settings.setShowAlcohol(value ?? false),
                    ),
                    const flutter_material.Divider(height: 1),
                    flutter_material.CheckboxListTile(
                      title: const flutter_material.Text('Vaping'),
                      subtitle: const flutter_material.Text(
                        'Show vaping tracking',
                      ),
                      value: settings.showVaping,
                      onChanged: (value) =>
                          settings.setShowVaping(value ?? false),
                    ),
                    const flutter_material.Divider(height: 1),
                    flutter_material.CheckboxListTile(
                      title: const flutter_material.Text('Smoking'),
                      subtitle: const flutter_material.Text(
                        'Show smoking tracking',
                      ),
                      value: settings.showSmoking,
                      onChanged: (value) =>
                          settings.setShowSmoking(value ?? false),
                    ),
                    const flutter_material.Divider(height: 1),
                    flutter_material.CheckboxListTile(
                      title: const flutter_material.Text('Opioids'),
                      subtitle: const flutter_material.Text(
                        'Show opioids tracking',
                      ),
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

  flutter_material.Widget _buildSectionHeader(String title) {
    return flutter_material.Padding(
      padding: const flutter_material.EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: flutter_material.Text(
        title,
        style: const flutter_material.TextStyle(
          fontSize: 14,
          fontWeight: flutter_material.FontWeight.w600,
          color: flutter_material.Colors.grey,
        ),
      ),
    );
  }

  String _getThemeModeText(flutter_material.ThemeMode mode) {
    switch (mode) {
      case flutter_material.ThemeMode.light:
        return 'Light';
      case flutter_material.ThemeMode.dark:
        return 'Dark';
      case flutter_material.ThemeMode.system:
        return 'System';
    }
  }

  void _showThemeModeDialog(
    flutter_material.BuildContext context,
    SettingsProvider settings,
  ) {
    flutter_material.showDialog(
      context: context,
      builder: (context) => flutter_material.AlertDialog(
        title: const flutter_material.Text('Theme Mode'),
        content: RadioGroup<flutter_material.ThemeMode>(
          value: settings.themeMode,
          onChanged: (value) {
            if (value != null) {
              settings.setThemeMode(value);
              flutter_material.Navigator.pop(context);
            }
          },
          children: flutter_material.ThemeMode.values.map((mode) {
            return flutter_material.RadioListTile<flutter_material.ThemeMode>(
              title: flutter_material.Text(_getThemeModeText(mode)),
              value: mode,
              // ignore: deprecated_member_use
              groupValue: settings.themeMode,
              // ignore: deprecated_member_use
              onChanged: (value) {}, // Handled by RadioGroup
              selected: settings.themeMode == mode,
            );
          }).toList(),
        ),
        actions: [
          flutter_material.TextButton(
            onPressed: () => flutter_material.Navigator.pop(context),
            child: const flutter_material.Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showColorSchemeDialog(
    flutter_material.BuildContext context,
    SettingsProvider settings,
  ) {
    flutter_material.showDialog(
      context: context,
      builder: (context) => flutter_material.AlertDialog(
        title: const flutter_material.Text('Color Scheme'),
        content: RadioGroup<ColorSchemeType>(
          value: settings.colorSchemeType,
          onChanged: (value) {
            if (value != null) {
              settings.setColorSchemeType(value);
              flutter_material.Navigator.pop(context);
            }
          },
          children: ColorSchemeType.values.map((type) {
            return flutter_material.RadioListTile<ColorSchemeType>(
              title: flutter_material.Text(
                ColorSchemeHelper.getColorSchemeName(type),
              ),
              value: type,
              // ignore: deprecated_member_use
              groupValue: settings.colorSchemeType,
              // ignore: deprecated_member_use
              onChanged: (value) {}, // Handled by RadioGroup
            );
          }).toList(),
        ),
        actions: [
          flutter_material.TextButton(
            onPressed: () => flutter_material.Navigator.pop(context),
            child: const flutter_material.Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
