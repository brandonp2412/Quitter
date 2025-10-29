import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/tasks.dart';
import 'package:quitter/app_theme_mode.dart';

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
    'swipeTabs': 'swipe_tabs',
    'journal': 'show_journal',
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

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

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
    final themeValue = await _storage.read(key: _themeKey);
    _themeMode = themeValue != null
        ? AppThemeMode.values[int.parse(themeValue)]
        : AppThemeMode.system;

    final colorSchemeValue = await _storage.read(key: _colorSchemeKey);
    _colorSchemeType = colorSchemeValue != null
        ? ColorSchemeType.values[int.parse(colorSchemeValue)]
        : ColorSchemeType.dynamic;

    final notifyAtValue = await _storage.read(key: _notifyAtKey);
    _notifyAt = notifyAtValue != null ? int.parse(notifyAtValue) : (8 * 60);

    final notifyEveryValue = await _storage.read(key: _notifyEveryKey);
    _notifyEvery = notifyEveryValue != null ? int.parse(notifyEveryValue) : 1;

    for (final entry in _showKeys.entries) {
      final value = await _storage.read(key: entry.value);
      _showSettings[entry.key] = value != null ? value == 'true' : true;
    }

    for (final entry in _notifyKeys.entries) {
      final value = await _storage.read(key: entry.value);
      _notifySettings[entry.key] = value != null ? value == 'true' : true;
    }

    notifyListeners();
  }

  Future<void> _updateBoolSetting(
    Map<String, bool> settings,
    Map<String, String> keys,
    String key,
    bool value,
  ) async {
    settings[key] = value;
    await _storage.write(key: keys[key]!, value: value.toString());
    notifyListeners();
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    _themeMode = mode;
    await _storage.write(key: _themeKey, value: mode.index.toString());
    notifyListeners();
  }

  Future<void> setColorSchemeType(ColorSchemeType type) async {
    _colorSchemeType = type;
    await _storage.write(key: _colorSchemeKey, value: type.index.toString());
    notifyListeners();
  }

  Future<void> setNotifyAt(int value) async {
    _notifyAt = value;
    await _storage.write(key: _notifyAtKey, value: value.toString());
    notifyListeners();
    cancelTasks();
    setupTasks();
  }

  Future<void> setNotifyEvery(int days) async {
    _notifyEvery = days;
    await _storage.write(key: _notifyEveryKey, value: days.toString());
    notifyListeners();
    cancelTasks();
    setupTasks();
  }

  Future<void> setShowAlcohol(bool show) async =>
      await _updateBoolSetting(_showSettings, _showKeys, 'alcohol', show);
  Future<void> setSwipeTabs(bool show) async =>
      await _updateBoolSetting(_showSettings, _showKeys, 'swipeTabs', show);
  Future<void> setShowReset(bool show) async =>
      await _updateBoolSetting(_showSettings, _showKeys, 'reset', show);
  Future<void> setShowJournal(bool show) async =>
      await _updateBoolSetting(_showSettings, _showKeys, 'journal', show);
  Future<void> setShowVaping(bool show) async =>
      await _updateBoolSetting(_showSettings, _showKeys, 'vaping', show);
  Future<void> setShowSmoking(bool show) async =>
      await _updateBoolSetting(_showSettings, _showKeys, 'smoking', show);
  Future<void> setShowNicotinePouches(bool show) async =>
      await _updateBoolSetting(
        _showSettings,
        _showKeys,
        'nicotinePouches',
        show,
      );
  Future<void> setShowMarijuana(bool show) async =>
      await _updateBoolSetting(_showSettings, _showKeys, 'marijuana', show);
  Future<void> setShowOpioids(bool show) async =>
      await _updateBoolSetting(_showSettings, _showKeys, 'opioids', show);
  Future<void> setShowSocialMedia(bool show) async =>
      await _updateBoolSetting(_showSettings, _showKeys, 'socialMedia', show);
  Future<void> setShowPornography(bool show) async =>
      await _updateBoolSetting(_showSettings, _showKeys, 'pornography', show);

  Future<void> setNotifyAlcohol(bool notify) async =>
      await _updateBoolSetting(_notifySettings, _notifyKeys, 'alcohol', notify);
  Future<void> setNotifyVaping(bool notify) async =>
      await _updateBoolSetting(_notifySettings, _notifyKeys, 'vaping', notify);
  Future<void> setNotifySmoking(bool notify) async =>
      await _updateBoolSetting(_notifySettings, _notifyKeys, 'smoking', notify);
  Future<void> setNotifyOpioids(bool notify) async =>
      await _updateBoolSetting(_notifySettings, _notifyKeys, 'opioids', notify);
  Future<void> setNotifyPouches(bool notify) async =>
      await _updateBoolSetting(_notifySettings, _notifyKeys, 'pouches', notify);
  Future<void> setNotifySocialMedia(bool notify) async =>
      await _updateBoolSetting(
        _notifySettings,
        _notifyKeys,
        'socialMedia',
        notify,
      );
  Future<void> setNotifyPornography(bool notify) async =>
      await _updateBoolSetting(
        _notifySettings,
        _notifyKeys,
        'pornography',
        notify,
      );
  Future<void> setNotifyRelapse(bool notify) async =>
      await _updateBoolSetting(_notifySettings, _notifyKeys, 'relapse', notify);
  Future<void> setNotifyMarijuana(bool notify) async =>
      await _updateBoolSetting(
        _notifySettings,
        _notifyKeys,
        'marijuana',
        notify,
      );
}
