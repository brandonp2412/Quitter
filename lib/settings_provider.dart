import 'package:flutter/material.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/reminders.dart';

class SettingsProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  static const String _colorSchemeKey = 'color_scheme';
  static const String _notifyEveryKey = 'notify_every';
  static const String _alcoholKey = 'show_alcohol';
  static const String _nicotinePouchesKey = 'show_nicotine_pouches';
  static const String _vapingKey = 'show_vaping';
  static const String _smokingKey = 'show_smoking';
  static const String _opioidsKey = 'show_opioids';
  static const String _notifyAlcoholKey = 'notify_alcohol';
  static const String _notifyVapingKey = 'notify_vaping';
  static const String _notifySmokingKey = 'notify_smoking';
  static const String _notifyOpioidsKey = 'notify_opioids';

  SharedPreferences? _prefs;

  ThemeMode _themeMode = ThemeMode.system;
  ColorSchemeType _colorSchemeType = ColorSchemeType.dynamic;
  int _notifyEvery = 1;
  bool _showAlcohol = true;
  bool _showVaping = true;
  bool _showSmoking = true;
  bool _showNicotinePouches = true;
  bool _showOpioids = true;
  bool _notifyAlcohol = true;
  bool _notifyVaping = true;
  bool _notifySmoking = true;
  bool _notifyOpioids = true;

  ThemeMode get themeMode => _themeMode;
  ColorSchemeType get colorSchemeType => _colorSchemeType;
  bool get showAlcohol => _showAlcohol;
  bool get showVaping => _showVaping;
  bool get showSmoking => _showSmoking;
  bool get showNicotinePouches => _showNicotinePouches;
  int get notifyEvery => _notifyEvery;
  bool get showOpioids => _showOpioids;
  bool get notifyAlcohol => _notifyAlcohol;
  bool get notifyVaping => _notifyVaping;
  bool get notifySmoking => _notifySmoking;
  bool get notifyOpioids => _notifyOpioids;

  Future<void> loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    _themeMode =
        ThemeMode.values[_prefs!.getInt(_themeKey) ?? ThemeMode.system.index];
    _colorSchemeType =
        ColorSchemeType.values[_prefs!.getInt(_colorSchemeKey) ??
            ColorSchemeType.dynamic.index];
    _notifyEvery = _prefs!.getInt(_notifyEveryKey) ?? 1;
    _showAlcohol = _prefs!.getBool(_alcoholKey) ?? true;
    _showVaping = _prefs!.getBool(_vapingKey) ?? true;
    _showSmoking = _prefs!.getBool(_smokingKey) ?? true;
    _showOpioids = _prefs!.getBool(_opioidsKey) ?? true;
    _notifyAlcohol = _prefs!.getBool(_notifyAlcoholKey) ?? true;
    _notifyVaping = _prefs!.getBool(_notifyVapingKey) ?? true;
    _notifySmoking = _prefs!.getBool(_notifySmokingKey) ?? true;
    _notifyOpioids = _prefs!.getBool(_notifyOpioidsKey) ?? true;

    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _prefs?.setInt(_themeKey, mode.index);
    notifyListeners();
  }

  Future<void> setNotifyEvery(int days) async {
    _notifyEvery = days;
    await _prefs?.setInt(_notifyEveryKey, days);
    notifyListeners();
    cancelReminders();
    await setupReminders();
  }

  Future<void> setColorSchemeType(ColorSchemeType type) async {
    _colorSchemeType = type;
    await _prefs?.setInt(_colorSchemeKey, type.index);
    notifyListeners();
  }

  Future<void> setShowNicotinePouches(bool show) async {
    _showNicotinePouches = show;
    await _prefs?.setBool(_nicotinePouchesKey, show);
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

  Future<void> setNotifyAlcohol(bool notify) async {
    _notifyAlcohol = notify;
    await _prefs?.setBool(_notifyAlcoholKey, notify);
    notifyListeners();
  }

  Future<void> setNotifyVaping(bool notify) async {
    _notifyVaping = notify;
    await _prefs?.setBool(_notifyVapingKey, notify);
    notifyListeners();
  }

  Future<void> setNotifySmoking(bool notify) async {
    _notifySmoking = notify;
    await _prefs?.setBool(_notifySmokingKey, notify);
    notifyListeners();
  }

  Future<void> setNotifyOpioids(bool notify) async {
    _notifyOpioids = notify;
    await _prefs?.setBool(_notifyOpioidsKey, notify);
    notifyListeners();
  }
}
