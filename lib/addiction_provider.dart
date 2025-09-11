import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/custom_quit_entry.dart';

class AddictionProvider extends ChangeNotifier {
  SharedPreferences? _prefs;

  String? _quitSmoking;
  String? _quitVaping;
  String? _quitAlcohol;
  String? _quitOpioids;
  String? _quitPouches;
  String? _quitSocialMedia;
  String? _quitPornography;
  String? _quitMarijuana;

  List<CustomQuitEntry> customEntries = [];

  Future<void> loadAddictions() async {
    _prefs = await SharedPreferences.getInstance();

    _quitSmoking = _prefs!.getString('smoking');
    _quitVaping = _prefs!.getString('vaping');
    _quitAlcohol = _prefs!.getString('alcohol');
    _quitOpioids = _prefs!.getString('opioids');
    _quitPouches = _prefs!.getString('nicotine_pouches');
    _quitSocialMedia = _prefs!.getString('social_media');
    _quitPornography = _prefs!.getString('pornography');
    _quitMarijuana = _prefs!.getString('marijuana');

    final String? customEntriesJson = _prefs!.getString('custom_quit_entries');
    if (customEntriesJson != null) {
      final List<dynamic> decodedData = json.decode(customEntriesJson);
      customEntries = decodedData
          .map((item) => CustomQuitEntry.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    notifyListeners();
  }

  String? getAddiction(String key) {
    return _prefs?.getString(key);
  }

  void setAddiction(String key, String? value) {
    if (value == null)
      _prefs?.remove(key);
    else
      _prefs?.setString(key, value);
    loadAddictions();
  }

  String? get quitAlcohol => _quitAlcohol;
  set quitAlcohol(String? value) {
    _prefs?.setString('alcohol', value ?? '');
    _quitAlcohol = value;
    notifyListeners();
  }

  String? get quitVaping => _quitVaping;
  set quitVaping(String? value) {
    _prefs?.setString('vaping', value ?? '');
    _quitVaping = value;
    notifyListeners();
  }

  String? get quitSmoking => _quitSmoking;
  set quitSmoking(String? value) {
    _prefs?.setString('smoking', value ?? '');
    _quitSmoking = value;
    notifyListeners();
  }

  String? get quitPouches => _quitPouches;
  set quitPouches(String? value) {
    _prefs?.setString('nicotine_pouches', value ?? '');
    _quitPouches = value;
    notifyListeners();
  }

  String? get quitOpioids => _quitOpioids;
  set quitOpioids(String? value) {
    _prefs?.setString('opioids', value ?? '');
    _quitOpioids = value;
    notifyListeners();
  }

  String? get quitSocialMedia => _quitSocialMedia;
  set quitSocialMedia(String? value) {
    _prefs?.setString('social_media', value ?? '');
    _quitSocialMedia = value;
    notifyListeners();
  }

  String? get quitPornography => _quitPornography;
  set quitPornography(String? value) {
    _prefs?.setString('pornography', value ?? '');
    _quitPornography = value;
    notifyListeners();
  }

  String? get quitMarijuana => _quitMarijuana;
  set quitMarijuana(String? value) {
    _prefs?.setString('marijuana', value ?? '');
    _quitMarijuana = value;
    notifyListeners();
  }

  Future<void> _saveCustomEntries() async {
    final List<Map<String, dynamic>> jsonList = customEntries
        .map((entry) => entry.toJson())
        .toList();
    await _prefs?.setString('custom_quit_entries', json.encode(jsonList));
  }

  Future<void> addCustomEntry(CustomQuitEntry entry) async {
    customEntries.add(entry);
    await _saveCustomEntries();
    notifyListeners();
  }

  Future<void> updateCustomEntry(CustomQuitEntry entry) async {
    final index = customEntries.indexWhere((e) => e.id == entry.id);
    if (index != -1) {
      customEntries[index] = entry;
      await _saveCustomEntries();
      notifyListeners();
    }
  }

  Future<void> deleteCustomEntry(String id) async {
    customEntries.removeWhere((entry) => entry.id == id);
    await _saveCustomEntries();
    notifyListeners();
  }
}
