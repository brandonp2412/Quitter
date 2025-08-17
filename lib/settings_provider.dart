import 'package:flutter/material.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  ThemeMode get themeMode => _themeMode;
  ColorSchemeType get colorSchemeType => _colorSchemeType;
  bool get showAlcohol => _showAlcohol;
  bool get showVaping => _showVaping;
  bool get showSmoking => _showSmoking;
  bool get showOpioids => _showOpioids;

  Future<void> loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    _themeMode =
        ThemeMode.values[_prefs!.getInt(_themeKey) ?? ThemeMode.system.index];
    _colorSchemeType =
        ColorSchemeType.values[_prefs!.getInt(_colorSchemeKey) ??
            ColorSchemeType.dynamic.index];
    _showAlcohol = _prefs!.getBool(_alcoholKey) ?? true;
    _showVaping = _prefs!.getBool(_vapingKey) ?? true;
    _showSmoking = _prefs!.getBool(_smokingKey) ?? true;
    _showOpioids = _prefs!.getBool(_opioidsKey) ?? true;

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
