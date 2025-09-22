import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/app_theme_mode.dart';

void main() {
  group('SettingsProvider', () {
    late SettingsProvider provider;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      provider = SettingsProvider();
      await provider.loadPreferences();
    });

    test('initial values are correct', () {
      expect(provider.themeMode, AppThemeMode.system);
      expect(provider.colorSchemeType, ColorSchemeType.dynamic);
      expect(provider.showAlcohol, true);
      expect(provider.showVaping, true);
      expect(provider.showSmoking, true);
      expect(provider.showOpioids, true);
    });

    test('themeMode setter updates theme mode', () async {
      provider.themeMode = AppThemeMode.dark;
      expect(provider.themeMode, AppThemeMode.dark);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getInt('theme_mode'), AppThemeMode.dark.index);
    });

    test('colorSchemeType setter updates color scheme type', () async {
      provider.colorSchemeType = ColorSchemeType.blue;
      expect(provider.colorSchemeType, ColorSchemeType.blue);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getInt('color_scheme'), ColorSchemeType.blue.index);
    });

    test('showAlcohol setter updates show alcohol setting', () async {
      provider.showAlcohol = false;
      expect(provider.showAlcohol, false);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('show_alcohol'), false);
    });

    test('showVaping setter updates show vaping setting', () async {
      provider.showVaping = false;
      expect(provider.showVaping, false);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('show_vaping'), false);
    });

    test('showSmoking setter updates show smoking setting', () async {
      provider.showSmoking = false;
      expect(provider.showSmoking, false);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('show_smoking'), false);
    });

    test('showOpioids setter updates show opioids setting', () async {
      provider.showOpioids = false;
      expect(provider.showOpioids, false);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('show_opioids'), false);
    });

    test('loadPreferences loads saved values', () async {
      SharedPreferences.setMockInitialValues({
        'theme_mode': AppThemeMode.dark.index,
        'color_scheme': ColorSchemeType.red.index,
        'show_alcohol': false,
        'show_vaping': false,
        'show_smoking': false,
        'show_opioids': false,
      });
      provider = SettingsProvider();
      await provider.loadPreferences();

      expect(provider.themeMode, AppThemeMode.dark);
      expect(provider.colorSchemeType, ColorSchemeType.red);
      expect(provider.showAlcohol, false);
      expect(provider.showVaping, false);
      expect(provider.showSmoking, false);
      expect(provider.showOpioids, false);
    });
  });
}
