import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/custom_quit_entry.dart';
import 'package:quitter/reminders.dart';

class SettingsProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  static const String _colorSchemeKey = 'color_scheme';
  static const String _notifyEveryKey = 'notify_every';
  static const String _alcoholKey = 'show_alcohol';
  static const String _nicotinePouchesKey = 'show_nicotine_pouches';
  static const String _marijuanaKey = 'show_marijuana';
  static const String _showResetKey = 'show_reset';
  static const String _vapingKey = 'show_vaping';
  static const String _smokingKey = 'show_smoking';
  static const String _opioidsKey = 'show_opioids';
  static const String _socialMediaKey = 'show_social_media';
  static const String _pornographyKey = 'show_pornography';
  static const String _notifyAlcoholKey = 'notify_alcohol';
  static const String _notifyMarijuanaKey = 'notify_marijuana';
  static const String _notifyVapingKey = 'notify_vaping';
  static const String _notifySmokingKey = 'notify_smoking';
  static const String _notifyOpioidsKey = 'notify_opioids';
  static const String _notifyPouchesKey = 'notify_nicotine_pouches';
  static const String _notifyRelapseKey = 'notify_relapse';
  static const String _notifySocialMediaKey = 'notify_social_media';
  static const String _notifyPornographyKey = 'notify_pornography';
  static const String _customEntriesKey = 'custom_quit_entries';

  SharedPreferences? _prefs;

  ThemeMode _themeMode = ThemeMode.system;
  ColorSchemeType _colorSchemeType = ColorSchemeType.dynamic;
  int _notifyEvery = 1;
  bool _showAlcohol = true;
  bool _showVaping = true;
  bool _showSmoking = true;
  bool _showNicotinePouches = true;
  bool _showOpioids = true;
  bool _showSocialMedia = true;
  bool _showPornography = true;
  bool _notifyAlcohol = true;
  bool _notifyVaping = true;
  bool _notifySmoking = true;
  bool _notifyOpioids = true;
  bool _notifyPouches = true;
  bool _notifySocialMedia = true;
  bool _notifyPornography = true;
  bool _notifyRelapse = true;
  bool _notifyMarijuana = true;
  bool _showMarijuana = true;
  bool _showReset = true;
  List<CustomQuitEntry> _customEntries = [];

  ThemeMode get themeMode => _themeMode;
  ColorSchemeType get colorSchemeType => _colorSchemeType;
  bool get showAlcohol => _showAlcohol;
  bool get showReset => _showReset;
  bool get showVaping => _showVaping;
  bool get showSmoking => _showSmoking;
  bool get showNicotinePouches => _showNicotinePouches;
  bool get showMarijuana => _showMarijuana;
  int get notifyEvery => _notifyEvery;
  bool get showOpioids => _showOpioids;
  bool get showSocialMedia => _showSocialMedia;
  bool get showPornography => _showPornography;
  bool get notifyAlcohol => _notifyAlcohol;
  bool get notifyVaping => _notifyVaping;
  bool get notifySmoking => _notifySmoking;
  bool get notifyOpioids => _notifyOpioids;
  bool get notifyPouches => _notifyPouches;
  bool get notifySocialMedia => _notifySocialMedia;
  bool get notifyPornography => _notifyPornography;
  bool get notifyRelapse => _notifyRelapse;
  bool get notifyMarijuana => _notifyMarijuana;
  List<CustomQuitEntry> get customEntries => _customEntries;

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
    _showReset = _prefs!.getBool(_showResetKey) ?? true;
    _showSmoking = _prefs!.getBool(_smokingKey) ?? true;
    _showOpioids = _prefs!.getBool(_opioidsKey) ?? true;
    _showSocialMedia = _prefs!.getBool(_socialMediaKey) ?? true;
    _showPornography = _prefs!.getBool(_pornographyKey) ?? true;
    _notifyAlcohol = _prefs!.getBool(_notifyAlcoholKey) ?? true;
    _notifyVaping = _prefs!.getBool(_notifyVapingKey) ?? true;
    _notifySmoking = _prefs!.getBool(_notifySmokingKey) ?? true;
    _notifyOpioids = _prefs!.getBool(_notifyOpioidsKey) ?? true;
    _notifySocialMedia = _prefs!.getBool(_notifySocialMediaKey) ?? true;
    _notifyPornography = _prefs!.getBool(_notifyPornographyKey) ?? true;
    _notifyMarijuana = _prefs!.getBool(_notifyMarijuanaKey) ?? true;
    _showNicotinePouches = _prefs!.getBool(_nicotinePouchesKey) ?? true;
    _showMarijuana = _prefs!.getBool(_marijuanaKey) ?? true;

    final String? customEntriesJson = _prefs!.getString(_customEntriesKey);
    if (customEntriesJson != null) {
      final List<dynamic> decodedData = json.decode(customEntriesJson);
      _customEntries = decodedData
          .map((item) => CustomQuitEntry.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    notifyListeners();
  }

  Future<void> _saveCustomEntries() async {
    final List<Map<String, dynamic>> jsonList = _customEntries
        .map((entry) => entry.toJson())
        .toList();
    await _prefs?.setString(_customEntriesKey, json.encode(jsonList));
  }

  Future<void> addCustomEntry(CustomQuitEntry entry) async {
    _customEntries.add(entry);
    await _saveCustomEntries();
    notifyListeners();
  }

  Future<void> updateCustomEntry(CustomQuitEntry entry) async {
    final index = _customEntries.indexWhere((e) => e.id == entry.id);
    if (index != -1) {
      _customEntries[index] = entry;
      await _saveCustomEntries();
      notifyListeners();
    }
  }

  Future<void> deleteCustomEntry(String id) async {
    _customEntries.removeWhere((entry) => entry.id == id);
    await _saveCustomEntries();
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

  Future<void> setShowMarijuana(bool show) async {
    _showMarijuana = show;
    await _prefs?.setBool(_marijuanaKey, show);
    notifyListeners();
  }

  Future<void> setShowReset(bool show) async {
    _showReset = show;
    await _prefs?.setBool(_showResetKey, show);
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

  Future<void> setShowSocialMedia(bool show) async {
    _showSocialMedia = show;
    await _prefs?.setBool(_socialMediaKey, show);
    notifyListeners();
  }

  Future<void> setShowPornography(bool show) async {
    _showPornography = show;
    await _prefs?.setBool(_pornographyKey, show);
    notifyListeners();
  }

  Future<void> setNotifyRelapse(bool notify) async {
    _notifyRelapse = notify;
    await _prefs?.setBool(_notifyRelapseKey, notify);
    notifyListeners();
  }

  Future<void> setNotifyPouches(bool notify) async {
    _notifyPouches = notify;
    await _prefs?.setBool(_notifyPouchesKey, notify);
    notifyListeners();
  }

  Future<void> setNotifyAlcohol(bool notify) async {
    _notifyAlcohol = notify;
    await _prefs?.setBool(_notifyAlcoholKey, notify);
    notifyListeners();
  }

  Future<void> setNotifyMarijuana(bool notify) async {
    _notifyMarijuana = notify;
    await _prefs?.setBool(_notifyMarijuanaKey, notify);
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

  Future<void> setNotifySocialMedia(bool notify) async {
    _notifySocialMedia = notify;
    await _prefs?.setBool(_notifySocialMediaKey, notify);
    notifyListeners();
  }

  Future<void> setNotifyPornography(bool notify) async {
    _notifyPornography = notify;
    await _prefs?.setBool(_notifyPornographyKey, notify);
    notifyListeners();
  }
}
