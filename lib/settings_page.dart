import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/main.dart';

class ColorSchemeHelper {
  static ColorScheme getColorScheme(
    ColorSchemeType type,
    Brightness brightness,
    ColorScheme? dynamicScheme,
  ) {
    switch (type) {
      case ColorSchemeType.dynamic:
        return dynamicScheme ??
            ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: brightness,
            );
      case ColorSchemeType.blue:
        return ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: brightness,
        );
      case ColorSchemeType.green:
        return ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: brightness,
        );
      case ColorSchemeType.red:
        return ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: brightness,
        );
      case ColorSchemeType.purple:
        return ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: brightness,
        );
      case ColorSchemeType.orange:
        return ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: brightness,
        );
    }
  }

  static String getColorSchemeName(ColorSchemeType type) {
    switch (type) {
      case ColorSchemeType.dynamic:
        return 'Dynamic Colors';
      case ColorSchemeType.blue:
        return 'Blue';
      case ColorSchemeType.green:
        return 'Green';
      case ColorSchemeType.red:
        return 'Red';
      case ColorSchemeType.purple:
        return 'Purple';
      case ColorSchemeType.orange:
        return 'Orange';
    }
  }
}

// Settings Page
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Theme Section
              _buildSectionHeader('Appearance'),
              const SizedBox(height: 8),

              // Theme Mode
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

              // Main Screen Items Section
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
