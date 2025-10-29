import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_widget/home_widget.dart';
import 'package:quitter/entry.dart';

class AddictionProvider extends ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

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
    _smoking = await _storage.read(key: 'smoking');
    _vaping = await _storage.read(key: 'vaping');
    _alcohol = await _storage.read(key: 'alcohol');
    _opioids = await _storage.read(key: 'opioids');
    _pouches = await _storage.read(key: 'nicotine_pouches');
    _socialMedia = await _storage.read(key: 'social_media');
    _pornography = await _storage.read(key: 'pornography');
    _marijuana = await _storage.read(key: 'marijuana');

    final String? entriesJson = await _storage.read(key: 'entries');
    if (entriesJson != null) {
      final List<dynamic> data = json.decode(entriesJson);
      entries = data
          .map((item) => Entry.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    final String? daysJson = await _storage.read(key: 'days');
    if (daysJson != null) {
      final Map<String, dynamic> data = json.decode(daysJson);
      _days = data.map(
        (key, val) =>
            MapEntry(key, (val as List<dynamic>).map((e) => e as int).toList()),
      );
    }

    notifyListeners();
  }

  Future<String?> getAddiction(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> setAddiction(String key, String? value) async {
    if (value == null) {
      await _storage.delete(key: key);
    } else {
      await _storage.write(key: key, value: value);
    }
    await loadAddictions();
    if (defaultTargetPlatform == TargetPlatform.android)
      HomeWidget.updateWidget(name: 'QuitTrackerWidget');
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
    await _storage.write(key: 'entries', value: json.encode(list));
  }

  Future<void> addEntry(Entry e) async {
    entries.add(e);
    await _saveEntries();
    notifyListeners();
  }

  Future<void> updateEntry(Entry entry) async {
    final index = entries.indexWhere((e) => e.id == entry.id);
    if (index == -1) return;
    entries[index] = entry;
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
    final entry = entries[index];
    entry.daysAchieved.add(days);
    entry.quitDate = DateTime.now();
    await _saveEntries();
    notifyListeners();
  }

  Future<void> _saveDays() async {
    await _storage.write(key: 'days', value: json.encode(_days));
  }

  List<int> getDays(String key) {
    return _days[key] ?? const [];
  }

  Future<void> popDays(String key) async {
    _days.update(key, (val) => val.sublist(0, val.length - 1));
    await _saveDays();
    notifyListeners();
  }

  Future<void> resetAddiction(String key, int days) async {
    _days.update(key, (val) => [...val, days], ifAbsent: () => [days]);
    await _saveDays();
    await setAddiction(key, DateTime.now().toIso8601String());
  }

  Future<void> clearMilestoneDays(String key, List<int> daysToClear) async {
    if (_days.containsKey(key)) {
      _days[key]?.removeWhere((day) => daysToClear.contains(day));
      await _saveDays();
    } else {
      final entry = entries.firstWhere((entry) => entry.id == key);
      entry.daysAchieved = entry.daysAchieved
          .where((day) => !daysToClear.contains(day))
          .toList();
      await _saveEntries();
    }

    notifyListeners();
  }

  Future<void> clearDays() async {
    await _storage.delete(key: 'days');
    _days = {};
    notifyListeners();
  }
}
