import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Settings Provider
class SettingsProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  static const String _colorSchemeKey = 'color_scheme';
  static const String _alcoholKey = 'show_alcohol';
  static const String _vapingKey = 'show_vaping';
  static const String _smokingKey = 'show_smoking';
  static const String _opioidsKey = 'show_opioids';

  SharedPreferences? _prefs;

  ThemeMode _themeMode = ThemeMode.system;
  ColorSchemeType _colorSchemeType = ColorSchemeType.dynamic;
  bool _showAlcohol = true;
  bool _showVaping = true;
  bool _showSmoking = true;
  bool _showOpioids = true;

  // Getters
  ThemeMode get themeMode => _themeMode;
  ColorSchemeType get colorSchemeType => _colorSchemeType;
  bool get showAlcohol => _showAlcohol;
  bool get showVaping => _showVaping;
  bool get showSmoking => _showSmoking;
  bool get showOpioids => _showOpioids;

  // Initialize preferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _loadSettings();
  }

  void _loadSettings() {
    _themeMode =
        ThemeMode.values[_prefs?.getInt(_themeKey) ?? ThemeMode.system.index];
    _colorSchemeType =
        ColorSchemeType.values[_prefs?.getInt(_colorSchemeKey) ??
            ColorSchemeType.dynamic.index];
    _showAlcohol = _prefs?.getBool(_alcoholKey) ?? true;
    _showVaping = _prefs?.getBool(_vapingKey) ?? true;
    _showSmoking = _prefs?.getBool(_smokingKey) ?? true;
    _showOpioids = _prefs?.getBool(_opioidsKey) ?? true;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _prefs?.setInt(_themeKey, mode.index);
    notifyListeners();
  }

  Future<void> setColorSchemeType(ColorSchemeType type) async {
    _colorSchemeType = type;
    await _prefs?.setInt(_colorSchemeKey, type.index);
    notifyListeners();
  }

  Future<void> setShowAlcohol(bool show) async {
    _showAlcohol = show;
    await _prefs?.setBool(_alcoholKey, show);
    notifyListeners();
  }

  Future<void> setShowVaping(bool show) async {
    _showVaping = show;
    await _prefs?.setBool(_vapingKey, show);
    notifyListeners();
  }

  Future<void> setShowSmoking(bool show) async {
    _showSmoking = show;
    await _prefs?.setBool(_smokingKey, show);
    notifyListeners();
  }

  Future<void> setShowOpioids(bool show) async {
    _showOpioids = show;
    await _prefs?.setBool(_opioidsKey, show);
    notifyListeners();
  }
}

// Enum for color scheme types
enum ColorSchemeType { dynamic, blue, green, red, purple, orange }

// Color scheme helper
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

              // Color Scheme
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
              groupValue: settings.themeMode,
              onChanged: (value) {
                if (value != null) {
                  settings.setThemeMode(value);
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
