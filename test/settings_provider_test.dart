import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('SettingsProvider', () {
    late SettingsProvider provider;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      provider = SettingsProvider();
      await provider.loadPreferences();
    });

    test('initial values are correct', () {
      expect(provider.themeMode, ThemeMode.system);
      expect(provider.colorSchemeType, ColorSchemeType.dynamic);
      expect(provider.showAlcohol, true);
      expect(provider.showVaping, true);
      expect(provider.showSmoking, true);
      expect(provider.showOpioids, true);
    });

    test('setThemeMode updates theme mode', () async {
      await provider.setThemeMode(ThemeMode.dark);
      expect(provider.themeMode, ThemeMode.dark);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getInt('theme_mode'), ThemeMode.dark.index);
    });

    test('setColorSchemeType updates color scheme type', () async {
      await provider.setColorSchemeType(ColorSchemeType.blue);
      expect(provider.colorSchemeType, ColorSchemeType.blue);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getInt('color_scheme'), ColorSchemeType.blue.index);
    });

    test('setShowAlcohol updates show alcohol setting', () async {
      await provider.setShowAlcohol(false);
      expect(provider.showAlcohol, false);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('show_alcohol'), false);
    });

    test('setShowVaping updates show vaping setting', () async {
      await provider.setShowVaping(false);
      expect(provider.showVaping, false);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('show_vaping'), false);
    });

    test('setShowSmoking updates show smoking setting', () async {
      await provider.setShowSmoking(false);
      expect(provider.showSmoking, false);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('show_smoking'), false);
    });

    test('setShowOpioids updates show opioids setting', () async {
      await provider.setShowOpioids(false);
      expect(provider.showOpioids, false);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('show_opioids'), false);
    });

    test('loadPreferences loads saved values', () async {
      SharedPreferences.setMockInitialValues({
        'theme_mode': ThemeMode.dark.index,
        'color_scheme': ColorSchemeType.red.index,
        'show_alcohol': false,
        'show_vaping': false,
        'show_smoking': false,
        'show_opioids': false,
      });
      provider = SettingsProvider();
      await provider.loadPreferences();

      expect(provider.themeMode, ThemeMode.dark);
      expect(provider.colorSchemeType, ColorSchemeType.red);
      expect(provider.showAlcohol, false);
      expect(provider.showVaping, false);
      expect(provider.showSmoking, false);
      expect(provider.showOpioids, false);
    });
  });
}
