import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/tasks.dart';
import 'package:quitter/app_theme_mode.dart';

class SettingsProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  static const String _colorSchemeKey = 'color_scheme';
  static const String _notifyEveryKey = 'notify_every';
  static const String _notifyAtKey = 'notify_at';
  static const _pinHashKey = 'pin_hash';
  static const _pinEnabledKey = 'pin_enabled';
  static const _pinTimeoutKey = 'pin_timeout';
  static const _localeKey = 'locale';

  bool _isUnlocked = false;
  bool get isUnlocked => _isUnlocked;

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
    'cocaine': 'show_cocaine',
    'meth': 'show_meth',
    'swipeTabs': 'swipe_tabs',
    'journal': 'show_journal',
    'heroin': 'show_heroin',
    'benzos': 'show_benzos',
    'adderall': 'show_adderall',
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
    'cocaine': 'notify_cocaine',
    'meth': 'notify_meth',
    'heroin': 'notify_heroin',
    'adderall': 'notify_adderall',
    'benzos': 'notify_benzos',
  };

  bool _isPinEnabled = false;
  bool get isPinEnabled => _isPinEnabled;
  int _pinTimeout = 15;
  int get pinTimeout => _pinTimeout;
  String _locale = 'system';
  String get locale => _locale;
  SharedPreferences? _prefs;

  AppThemeMode _themeMode = AppThemeMode.system;
  ColorSchemeType _colorSchemeType = ColorSchemeType.dynamic;
  int _notifyEvery = 1;
  int _notifyAt = 8 * 60;

  final Map<String, bool> _showSettings = {
    for (String key in _showKeys.keys) key: true,
  };

  final Map<String, bool> _notifySettings = {
    for (String key in _notifyKeys.keys) key: true,
  };

  AppThemeMode get themeMode => _themeMode;
  ColorSchemeType get colorSchemeType => _colorSchemeType;
  int get notifyEvery => _notifyEvery;
  int get notifyAt => _notifyAt;

  bool get showAlcohol => _showSettings['alcohol']!;
  bool get showReset => _showSettings['reset']!;
  bool get showJournal => _showSettings['journal']!;
  bool get swipeTabs => _showSettings['swipeTabs']!;
  bool get showVaping => _showSettings['vaping']!;
  bool get showSmoking => _showSettings['smoking']!;
  bool get showNicotinePouches => _showSettings['nicotinePouches']!;
  bool get showMarijuana => _showSettings['marijuana']!;
  bool get showOpioids => _showSettings['opioids']!;
  bool get showSocialMedia => _showSettings['socialMedia']!;
  bool get showPornography => _showSettings['pornography']!;
  bool get showCocaine => _showSettings['cocaine']!;
  bool get showMeth => _showSettings['meth']!;
  bool get showHeroin => _showSettings['heroin']!;
  bool get showBenzos => _showSettings['benzos']!;
  bool get showAdderall => _showSettings['adderall']!;

  bool get notifyAlcohol => _notifySettings['alcohol']!;
  bool get notifyVaping => _notifySettings['vaping']!;
  bool get notifySmoking => _notifySettings['smoking']!;
  bool get notifyOpioids => _notifySettings['opioids']!;
  bool get notifyPouches => _notifySettings['pouches']!;
  bool get notifySocialMedia => _notifySettings['socialMedia']!;
  bool get notifyPornography => _notifySettings['pornography']!;
  bool get notifyCocaine => _notifySettings['cocaine']!;
  bool get notifyMeth => _notifySettings['meth']!;
  bool get notifyHeroin => _notifySettings['heroin']!;
  bool get notifyBenzos => _notifySettings['benzos']!;
  bool get notifyAdderall => _notifySettings['adderall']!;
  bool get notifyRelapse => _notifySettings['relapse']!;
  bool get notifyMarijuana => _notifySettings['marijuana']!;

  Future<bool> unlock(String pin) async {
    if (await verifyPin(pin)) {
      _isUnlocked = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  void lockApp() {
    _isUnlocked = false;
    notifyListeners();
  }

  Future<void> loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    _themeMode = AppThemeMode
        .values[_prefs!.getInt(_themeKey) ?? AppThemeMode.system.index];
    _colorSchemeType =
        ColorSchemeType.values[_prefs!.getInt(_colorSchemeKey) ??
            ColorSchemeType.dynamic.index];
    _notifyAt = _prefs!.getInt(_notifyAtKey) ?? (8 * 60);
    _notifyEvery = _prefs!.getInt(_notifyEveryKey) ?? 1;
    _pinTimeout = _prefs!.getInt(_pinTimeoutKey) ?? 15;
    _locale = _prefs!.getString(_localeKey) ?? 'system';

    _showKeys.forEach((key, prefKey) {
      _showSettings[key] = _prefs!.getBool(prefKey) ?? true;
    });

    _notifyKeys.forEach((key, prefKey) {
      _notifySettings[key] = _prefs!.getBool(prefKey) ?? true;
    });

    final enabled = _prefs?.getBool(_pinEnabledKey);
    _isPinEnabled = enabled == true;

    notifyListeners();
  }

  set locale(String locale) {
    _locale = locale;
    notifyListeners();
    _prefs?.setString(_localeKey, locale);
  }

  Future<void> setPinTimeout(int timeout) async {
    _pinTimeout = timeout;
    notifyListeners();
    await _prefs?.setInt(_pinTimeoutKey, timeout);
  }

  Future<void> setPinEnabled(bool enabled, String? pin) async {
    if (enabled && pin != null) {
      final hash = sha256.convert(utf8.encode(pin)).toString();
      await _prefs?.setString(_pinHashKey, hash);
      await _prefs?.setBool(_pinEnabledKey, true);
      _isPinEnabled = true;
    } else {
      await _prefs?.remove(_pinHashKey);
      await _prefs?.setBool(_pinEnabledKey, false);
      _isPinEnabled = false;
    }
    notifyListeners();
  }

  Future<bool> verifyPin(String pin) async {
    final storedHash = _prefs?.getString(_pinHashKey);
    if (storedHash == null) return false;

    final inputHash = sha256.convert(utf8.encode(pin)).toString();
    return inputHash == storedHash;
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

  set themeMode(AppThemeMode mode) {
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
    cancelTasks();
    setupTasks();
  }

  set notifyEvery(int days) {
    _notifyEvery = days;
    _prefs?.setInt(_notifyEveryKey, days);
    notifyListeners();
    cancelTasks();
    setupTasks();
  }

  set showAlcohol(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'alcohol', show);
  set swipeTabs(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'swipeTabs', show);
  set showReset(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'reset', show);
  set showJournal(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'journal', show);
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
  set showMeth(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'meth', show);
  set showHeroin(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'heroin', show);
  set showAdderall(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'adderall', show);
  set showBenzos(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'benzos', show);
  set showCocaine(bool show) =>
      _updateBoolSetting(_showSettings, _showKeys, 'cocaine', show);
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
  set notifyMeth(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'meth', notify);
  set notifyHeroin(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'heroin', notify);
  set notifyAdderall(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'adderall', notify);
  set notifyBenzos(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'benzos', notify);
  set notifyCocaine(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'cocaine', notify);
  set notifyPornography(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'pornography', notify);
  set notifyRelapse(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'relapse', notify);
  set notifyMarijuana(bool notify) =>
      _updateBoolSetting(_notifySettings, _notifyKeys, 'marijuana', notify);
}
