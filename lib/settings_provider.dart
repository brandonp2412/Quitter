import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/reminders.dart';

class SettingsProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  static const String _colorSchemeKey = 'color_scheme';
  static const String _notifyEveryKey = 'notify_every';
  static const String _notifyAtKey = 'notify_at';

  static const Map<String, String> _showKeys = {
    'alcohol': 'show_alcohol',
    'nicotinePouches': 'show_nicotine_pouches',
    'marijuana': 'show_marijuana',
    'reset': 'show_reset',
    'vaping': 'show_vaping',
    'smoking': 'show_smoking',
    'opioids': 'show_opioids',
    'socialMedia': 'show_social_media',
    'pornography': 'show_pornography',
  };

  static const Map<String, String> _notifyKeys = {
    'alcohol': 'notify_alcohol',
    'marijuana': 'notify_marijuana',
    'vaping': 'notify_vaping',
    'smoking': 'notify_smoking',
    'opioids': 'notify_opioids',
    'pouches': 'notify_nicotine_pouches',
    'relapse': 'notify_relapse',
    'socialMedia': 'notify_social_media',
    'pornography': 'notify_pornography',
  };

  SharedPreferences? _prefs;

  ThemeMode _themeMode = ThemeMode.system;
  ColorSchemeType _colorSchemeType = ColorSchemeType.dynamic;
  int _notifyEvery = 1;
  int _notifyAt = 8 * 60;

  final Map<String, bool> _showSettings = {
    for (String key in _showKeys.keys) key: true,
  };

  final Map<String, bool> _notifySettings = {
    for (String key in _notifyKeys.keys) key: true,
  };

  ThemeMode get themeMode => _themeMode;
  ColorSchemeType get colorSchemeType => _colorSchemeType;
  int get notifyEvery => _notifyEvery;
  int get notifyAt => _notifyAt;

  bool get showAlcohol => _showSettings['alcohol']!;
  bool get showReset => _showSettings['reset']!;
  bool get showVaping => _showSettings['vaping']!;
  bool get showSmoking => _showSettings['smoking']!;
  bool get showNicotinePouches => _showSettings['nicotinePouches']!;
  bool get showMarijuana => _showSettings['marijuana']!;
  bool get showOpioids => _showSettings['opioids']!;
  bool get showSocialMedia => _showSettings['socialMedia']!;
  bool get showPornography => _showSettings['pornography']!;

  bool get notifyAlcohol => _notifySettings['alcohol']!;
  bool get notifyVaping => _notifySettings['vaping']!;
  bool get notifySmoking => _notifySettings['smoking']!;
  bool get notifyOpioids => _notifySettings['opioids']!;
  bool get notifyPouches => _notifySettings['pouches']!;
  bool get notifySocialMedia => _notifySettings['socialMedia']!;
  bool get notifyPornography => _notifySettings['pornography']!;
  bool get notifyRelapse => _notifySettings['relapse']!;
  bool get notifyMarijuana => _notifySettings['marijuana']!;

  Future<void> loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    _themeMode =
        ThemeMode.values[_prefs!.getInt(_themeKey) ?? ThemeMode.system.index];
    _colorSchemeType =
        ColorSchemeType.values[_prefs!.getInt(_colorSchemeKey) ??
            ColorSchemeType.dynamic.index];
    _notifyAt = _prefs!.getInt(_notifyAtKey) ?? (8 * 60);
    _notifyEvery = _prefs!.getInt(_notifyEveryKey) ?? 1;

    _showKeys.forEach((key, prefKey) {
      _showSettings[key] = _prefs!.getBool(prefKey) ?? true;
    });

    _notifyKeys.forEach((key, prefKey) {
      _notifySettings[key] = _prefs!.getBool(prefKey) ?? true;
    });

    notifyListeners();
  }

  void _updateBoolSetting(
    Map<String, bool> settings,
    Map<String, String> keys,
    String key,
    bool value,
  ) {
    settings[key] = value;
    _prefs?.setBool(keys[key]!, value);
    notifyListeners();
  }

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    _prefs?.setInt(_themeKey, mode.index);
    notifyListeners();
  }

  set colorSchemeType(ColorSchemeType type) {
    _colorSchemeType = type;
    _prefs?.setInt(_colorSchemeKey, type.index);
    notifyListeners();
  }

  set notifyAt(int value) {
    _notifyAt = value;
    _prefs?.setInt(_notifyAtKey, value);
    notifyListeners();
    cancelReminders();
    setupReminders();
  }

  set notifyEvery(int days) {
    _notifyEvery = days;
    _prefs?.setInt(_notifyEveryKey, days);
    notifyListeners();
    cancelReminders();
    setupReminders();
  }

  set showAlcohol(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'alcohol', show);
  set showReset(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'reset', show);
  set showVaping(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'vaping', show);
  set showSmoking(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'smoking', show);
  set showNicotinePouches(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'nicotinePouches', show);
  set showMarijuana(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'marijuana', show);
  set showOpioids(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'opioids', show);
  set showSocialMedia(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'socialMedia', show);
  set showPornography(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'pornography', show);

  set notifyAlcohol(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'alcohol', notify);
  set notifyVaping(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'vaping', notify);
  set notifySmoking(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'smoking', notify);
  set notifyOpioids(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'opioids', notify);
  set notifyPouches(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'pouches', notify);
  set notifySocialMedia(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'socialMedia', notify);
  set notifyPornography(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'pornography', notify);
  set notifyRelapse(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'relapse', notify);
  set notifyMarijuana(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'marijuana', notify);
}
