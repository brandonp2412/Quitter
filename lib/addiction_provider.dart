import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/app_icons.dart';
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
  String? _cocaine;
  String? _meth;
  String? _marijuana;
  String? _benzos;
  String? _adderall;
  String? _ssri;
  String? _snri;
  String? _tca;
  String? _maoi;
  String? _nitrousOxide;
  String? _kratom;
  String? _gabapentinoids;
  String? _ghb;
  String? _ketamine;
  String? _inhalants;
  String? _syntheticCannabinoids;
  String? _mdma;
  String? _steroids;

  List<Entry> entries = [];
  List<String> cardOrder = [];
  Map<String, String> customNames = {};
  Map<String, IconData> customIcons = {};
  Map<String, Color> customColors = {};
  Map<String, List<int>> _days = {};

  Future<void> loadAddictions() async {
    _pref = await SharedPreferences.getInstance();

    await _migrateHeroinToOpioids();

    _smoking = _pref!.getString('smoking');
    _vaping = _pref!.getString('vaping');
    _alcohol = _pref!.getString('alcohol');
    _opioids = _pref!.getString('opioids');
    _pouches = _pref!.getString('nicotine_pouches');
    _socialMedia = _pref!.getString('social_media');
    _pornography = _pref!.getString('pornography');
    _marijuana = _pref!.getString('marijuana');
    _cocaine = _pref!.getString('cocaine');
    _meth = _pref!.getString('meth');
    _benzos = _pref!.getString('benzos');
    _adderall = _pref!.getString('adderall');
    _ssri = _pref!.getString('ssri');
    _snri = _pref!.getString('snri');
    _tca = _pref!.getString('tca');
    _maoi = _pref!.getString('maoi');
    _nitrousOxide = _pref!.getString('nitrous_oxide');
    _kratom = _pref!.getString('kratom');
    _gabapentinoids = _pref!.getString('gabapentinoids');
    _ghb = _pref!.getString('ghb');
    _ketamine = _pref!.getString('ketamine');
    _inhalants = _pref!.getString('inhalants');
    _syntheticCannabinoids = _pref!.getString('synthetic_cannabinoids');
    _mdma = _pref!.getString('mdma');
    _steroids = _pref!.getString('steroids');

    final String? entriesJson = _pref!.getString('entries');
    if (entriesJson != null) {
      final List<dynamic> data = json.decode(entriesJson);
      entries = data
          .map((item) => Entry.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    final String? orderJson = _pref!.getString('card_order');
    if (orderJson != null) {
      cardOrder = List<String>.from(json.decode(orderJson) as List<dynamic>);
    }

    final String? customNamesJson = _pref!.getString('custom_names');
    if (customNamesJson != null) {
      final Map<String, dynamic> data =
          json.decode(customNamesJson) as Map<String, dynamic>;
      customNames = data.map((key, val) => MapEntry(key, val as String));
    }

    final String? customIconsJson = _pref!.getString('custom_icons');
    if (customIconsJson != null) {
      final Map<String, dynamic> data =
          json.decode(customIconsJson) as Map<String, dynamic>;
      customIcons = {
        for (final entry in data.entries)
          if (allIcons[entry.value as String] != null)
            entry.key: allIcons[entry.value as String]!,
      };
    }

    final String? customColorsJson = _pref!.getString('custom_colors');
    if (customColorsJson != null) {
      final Map<String, dynamic> data =
          json.decode(customColorsJson) as Map<String, dynamic>;
      customColors = data.map((key, val) => MapEntry(key, Color(val as int)));
    }

    final String? daysJson = _pref!.getString('days');
    if (daysJson != null) {
      final Map<String, dynamic> data = json.decode(daysJson);
      _days = data.map(
        (key, val) =>
            MapEntry(key, (val as List<dynamic>).map((e) => e as int).toList()),
      );
    }

    _writeActiveAddictionKeysForWidget();

    notifyListeners();
  }

  /// Heroin tracking was merged into the general opioids entry, since the
  /// withdrawal evidence does not justify a separate heroin timeline.
  /// Moves any stored heroin data (quit date, milestone days, customisations,
  /// card order) onto the opioids key.
  Future<void> _migrateHeroinToOpioids() async {
    final String? heroin = _pref!.getString('heroin');
    if (heroin != null) {
      if (_pref!.getString('opioids') == null) {
        await _pref!.setString('opioids', heroin);
      }
      await _pref!.remove('heroin');
    }

    final String? daysJson = _pref!.getString('days');
    if (daysJson != null && daysJson.contains('"heroin"')) {
      final Map<String, dynamic> data =
          json.decode(daysJson) as Map<String, dynamic>;
      final heroinDays = data.remove('heroin');
      if (heroinDays != null) {
        data['opioids'] = [
          ...?data['opioids'] as List<dynamic>?,
          ...heroinDays as List<dynamic>,
        ];
      }
      await _pref!.setString('days', json.encode(data));
    }

    for (final key in ['custom_names', 'custom_icons', 'custom_colors']) {
      final String? jsonStr = _pref!.getString(key);
      if (jsonStr == null || !jsonStr.contains('"heroin"')) continue;
      final Map<String, dynamic> data =
          json.decode(jsonStr) as Map<String, dynamic>;
      final value = data.remove('heroin');
      if (value != null) data.putIfAbsent('opioids', () => value);
      await _pref!.setString(key, json.encode(data));
    }

    final String? orderJson = _pref!.getString('card_order');
    if (orderJson != null && orderJson.contains('"heroin"')) {
      final order = List<String>.from(json.decode(orderJson) as List<dynamic>);
      final index = order.indexOf('heroin');
      if (index != -1) {
        if (order.contains('opioids')) {
          order.removeAt(index);
        } else {
          order[index] = 'opioids';
        }
        await _pref!.setString('card_order', json.encode(order));
      }
    }
  }

  void _writeActiveAddictionKeysForWidget() {
    final allAddictions = <String, String?>{
      'smoking': _smoking,
      'vaping': _vaping,
      'alcohol': _alcohol,
      'opioids': _opioids,
      'nicotine_pouches': _pouches,
      'social_media': _socialMedia,
      'pornography': _pornography,
      'marijuana': _marijuana,
      'cocaine': _cocaine,
      'meth': _meth,
      'benzos': _benzos,
      'adderall': _adderall,
      'ssri': _ssri,
      'snri': _snri,
      'tca': _tca,
      'maoi': _maoi,
      'nitrous_oxide': _nitrousOxide,
      'kratom': _kratom,
      'gabapentinoids': _gabapentinoids,
      'ghb': _ghb,
      'ketamine': _ketamine,
      'inhalants': _inhalants,
      'synthetic_cannabinoids': _syntheticCannabinoids,
      'mdma': _mdma,
      'steroids': _steroids,
    };
    final activeKeys = allAddictions.entries
        .where((e) => e.value != null)
        .map((e) => e.key)
        .toList();
    _pref?.setString('active_addiction_keys', json.encode(activeKeys));
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
      HomeWidget.updateWidget(name: 'QuitTrackerWidget');
  }

  String? get quitAlcohol => _alcohol;
  String? get quitVaping => _vaping;
  String? get quitSmoking => _smoking;
  String? get quitPouches => _pouches;
  String? get quitOpioids => _opioids;
  String? get quitSocialMedia => _socialMedia;
  String? get quitPornography => _pornography;
  String? get quitMeth => _meth;
  String? get quitBenzos => _benzos;
  String? get quitAdderall => _adderall;
  String? get quitCocaine => _cocaine;
  String? get quitMarijuana => _marijuana;
  String? get quitSsri => _ssri;
  String? get quitSnri => _snri;
  String? get quitTca => _tca;
  String? get quitMaoi => _maoi;
  String? get quitNitrousOxide => _nitrousOxide;
  String? get quitKratom => _kratom;
  String? get quitGabapentinoids => _gabapentinoids;
  String? get quitGhb => _ghb;
  String? get quitKetamine => _ketamine;
  String? get quitInhalants => _inhalants;
  String? get quitSyntheticCannabinoids => _syntheticCannabinoids;
  String? get quitMdma => _mdma;
  String? get quitSteroids => _steroids;

  Future<void> saveCardOrder(List<String> order) async {
    cardOrder = order;
    await _pref?.setString('card_order', json.encode(order));
    notifyListeners();
  }

  Future<void> setCustomName(String key, String name) async {
    customNames[key] = name;
    await _pref?.setString('custom_names', json.encode(customNames));
    notifyListeners();
  }

  Future<void> setCustomIcon(String key, IconData icon) async {
    customIcons[key] = icon;
    final Map<String, String> serialized = {
      for (final entry in customIcons.entries)
        if (iconNames[entry.value] != null) entry.key: iconNames[entry.value]!,
    };
    await _pref?.setString('custom_icons', json.encode(serialized));
    notifyListeners();
  }

  Future<void> setCustomColor(String key, Color color) async {
    customColors[key] = color;
    await _pref?.setString(
      'custom_colors',
      json.encode(customColors.map((k, v) => MapEntry(k, v.toARGB32()))),
    );
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
    await _pref?.setString('days', json.encode(_days));
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
    setAddiction(key, DateTime.now().toIso8601String());
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

  void clearDays() async {
    await _pref?.remove('days');
    _days = {};
    notifyListeners();
  }
}
