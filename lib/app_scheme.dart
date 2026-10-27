import 'package:flutter/material.dart';
import 'package:quitter/color_scheme_type.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

class AppScheme {
  static ColorScheme getColorScheme(
    ColorSchemeType type,
    Brightness brightness,
    ColorScheme? dynamicScheme, [
    Color? customSeedColor,
  ]) {
    switch (type) {
      case ColorSchemeType.dynamic:
        return dynamicScheme ??
            ColorScheme.fromSeed(
              seedColor: const Color(0xFF2E4057),
              brightness: brightness,
            );
      case ColorSchemeType.blue:
        return ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: brightness,
        );
      case ColorSchemeType.green:
        return ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E8B57),
          brightness: brightness,
        );
      case ColorSchemeType.red:
        return ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: brightness,
        );
      case ColorSchemeType.purple:
        return ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: brightness,
        );
      case ColorSchemeType.orange:
        return ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: brightness,
        );
      case ColorSchemeType.custom:
        return ColorScheme.fromSeed(
          seedColor: customSeedColor ?? const Color(0xFF6750A4),
          brightness: brightness,
        );
    }
  }

  static String getName(ColorSchemeType type, AppLocalizations l10n) {
    switch (type) {
      case ColorSchemeType.dynamic:
        return l10n.settingsDynamicColorScheme;
      case ColorSchemeType.blue:
        return l10n.settingsBlueColorScheme;
      case ColorSchemeType.green:
        return l10n.settingsGreenColorScheme;
      case ColorSchemeType.red:
        return l10n.settingsRedColorScheme;
      case ColorSchemeType.purple:
        return l10n.settingsPurpleColorScheme;
      case ColorSchemeType.orange:
        return l10n.settingsOrangeColorScheme;
      case ColorSchemeType.custom:
        return '${l10n.addAddictionCustom} ${l10n.editEntryColor}';
    }
  }
}
