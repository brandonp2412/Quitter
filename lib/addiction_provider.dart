import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/entry.dart';

class AddictionProvider extends ChangeNotifier {
  SharedPreferences? _pref;

  String? _smoking;
  String? _vaping;
  String? _alcohol;
  String? _opioids;
  String? _pouches;
  String? _socialMedia;
  String? _pornography;
  String? _marijuana;

  List<Entry> entries = [];
  Map<String, List<int>> _days = {};

  Future<void> loadAddictions() async {
    _pref = await SharedPreferences.getInstance();

    _smoking = _pref!.getString('smoking');
    _vaping = _pref!.getString('vaping');
    _alcohol = _pref!.getString('alcohol');
    _opioids = _pref!.getString('opioids');
    _pouches = _pref!.getString('nicotine_pouches');
    _socialMedia = _pref!.getString('social_media');
    _pornography = _pref!.getString('pornography');
    _marijuana = _pref!.getString('marijuana');

    final String? entriesJson = _pref!.getString('entries');
    if (entriesJson != null) {
      final List<dynamic> data = json.decode(entriesJson);
      entries = data
          .map((item) => Entry.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    final String? daysJson = _pref!.getString('days');
    if (daysJson != null) {
      final Map<String, dynamic> data = json.decode(daysJson);
      _days = data.map(
        (key, val) =>
            MapEntry(key, (val as List<dynamic>).map((e) => e as int).toList()),
      );
    }

    notifyListeners();
  }

  String? getAddiction(String key) {
    return _pref?.getString(key);
  }

  void setAddiction(String key, String? value) {
    if (value == null) {
      _pref?.remove(key);
    } else {
      _pref?.setString(key, value);
    }
    loadAddictions();
    if (defaultTargetPlatform == TargetPlatform.android)
      widgetChannel.invokeMethod('updateWidget');
  }

  String? get quitAlcohol => _alcohol;
  String? get quitVaping => _vaping;
  String? get quitSmoking => _smoking;
  String? get quitPouches => _pouches;
  String? get quitOpioids => _opioids;
  String? get quitSocialMedia => _socialMedia;
  String? get quitPornography => _pornography;
  String? get quitMarijuana => _marijuana;

  Future<void> _saveEntries() async {
    final List<Map<String, dynamic>> list = entries
        .map((e) => e.toJson())
        .toList();
    await _pref?.setString('entries', json.encode(list));
  }

  Future<void> addEntry(Entry e) async {
    entries.add(e);
    await _saveEntries();
    notifyListeners();
  }

  Future<void> updateEntry(Entry e) async {
    final index = entries.indexWhere((entry) => entry.id == e.id);
    if (index == -1) return;
    entries[index] = e;
    await _saveEntries();
    notifyListeners();
  }

  Future<void> deleteEntry(String id) async {
    entries.removeWhere((e) => e.id == id);
    await _saveEntries();
    notifyListeners();
  }

  Future<void> resetEntry(String id, int days) async {
    final index = entries.indexWhere((e) => e.id == id);
    if (index == -1) return;
    final e = entries[index];
    e.daysAchieved.add(days);
    e.quitDate = DateTime.now();
    await _saveEntries();
    notifyListeners();
  }

  Future<void> _saveDays() async {
    await _pref?.setString('days', json.encode(_days));
  }

  List<int> getDays(String key) {
    return _days[key] ?? const [];
  }

  Future<void> resetAddiction(String key, int days) async {
    _days.update(key, (val) => [...val, days], ifAbsent: () => [days]);
    await _saveDays();
    setAddiction(key, DateTime.now().toIso8601String());
  }

  void clearDays() async {
    await _pref?.remove('days');
    _days = {};
    notifyListeners();
  }
}
