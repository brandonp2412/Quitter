import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/custom_quit_entry.dart';

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
  }

  String? get quitAlcohol => _alcohol;
  set quitAlcohol(String? value) {
    _pref?.setString('alcohol', value ?? '');
    _alcohol = value;
    notifyListeners();
  }

  String? get quitVaping => _vaping;
  set quitVaping(String? value) {
    _pref?.setString('vaping', value ?? '');
    _vaping = value;
    notifyListeners();
  }

  String? get quitSmoking => _smoking;
  set quitSmoking(String? value) {
    _pref?.setString('smoking', value ?? '');
    _smoking = value;
    notifyListeners();
  }

  String? get quitPouches => _pouches;
  set quitPouches(String? value) {
    _pref?.setString('nicotine_pouches', value ?? '');
    _pouches = value;
    notifyListeners();
  }

  String? get quitOpioids => _opioids;
  set quitOpioids(String? value) {
    _pref?.setString('opioids', value ?? '');
    _opioids = value;
    notifyListeners();
  }

  String? get quitSocialMedia => _socialMedia;
  set quitSocialMedia(String? value) {
    _pref?.setString('social_media', value ?? '');
    _socialMedia = value;
    notifyListeners();
  }

  String? get quitPornography => _pornography;
  set quitPornography(String? value) {
    _pref?.setString('pornography', value ?? '');
    _pornography = value;
    notifyListeners();
  }

  String? get quitMarijuana => _marijuana;
  set quitMarijuana(String? value) {
    _pref?.setString('marijuana', value ?? '');
    _marijuana = value;
    notifyListeners();
  }

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
