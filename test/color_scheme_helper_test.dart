import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/color_scheme_helper.dart';
import 'package:quitter/color_scheme_type.dart';

void main() {
  group('ColorSchemeHelper', () {
    test(
      'getColorScheme returns dynamic scheme when type is dynamic and scheme is provided',
      () {
        final ColorScheme scheme = ColorScheme.fromSeed(
          seedColor: Colors.black,
        );
        final ColorScheme colorScheme = ColorSchemeHelper.getColorScheme(
          ColorSchemeType.dynamic,
          Brightness.light,
          scheme,
        );
        expect(colorScheme, scheme);
      },
    );

    test(
      'getColorScheme returns default dynamic scheme when type is dynamic and no scheme is provided',
      () {
        final ColorScheme colorScheme = ColorSchemeHelper.getColorScheme(
          ColorSchemeType.dynamic,
          Brightness.light,
          null,
        );
        expect(colorScheme, isA<ColorScheme>());
        expect(colorScheme.brightness, Brightness.light);
      },
    );

    test('getColorScheme returns blue scheme', () {
      final ColorScheme colorScheme = ColorSchemeHelper.getColorScheme(
        ColorSchemeType.blue,
        Brightness.light,
        null,
      );
      expect(colorScheme, isA<ColorScheme>());
      expect(colorScheme.brightness, Brightness.light);
    });

    test('getColorScheme returns green scheme', () {
      final ColorScheme colorScheme = ColorSchemeHelper.getColorScheme(
        ColorSchemeType.green,
        Brightness.light,
        null,
      );
      expect(colorScheme, isA<ColorScheme>());
      expect(colorScheme.brightness, Brightness.light);
    });

    test('getColorScheme returns red scheme', () {
      final ColorScheme colorScheme = ColorSchemeHelper.getColorScheme(
        ColorSchemeType.red,
        Brightness.light,
        null,
      );
      expect(colorScheme, isA<ColorScheme>());
      expect(colorScheme.brightness, Brightness.light);
    });

    test('getColorScheme returns purple scheme', () {
      final ColorScheme colorScheme = ColorSchemeHelper.getColorScheme(
        ColorSchemeType.purple,
        Brightness.light,
        null,
      );
      expect(colorScheme, isA<ColorScheme>());
      expect(colorScheme.brightness, Brightness.light);
    });

    test('getColorScheme returns orange scheme', () {
      final ColorScheme colorScheme = ColorSchemeHelper.getColorScheme(
        ColorSchemeType.orange,
        Brightness.light,
        null,
      );
      expect(colorScheme, isA<ColorScheme>());
      expect(colorScheme.brightness, Brightness.light);
    });

    test('getColorSchemeName returns correct name for dynamic', () {
      final String name = ColorSchemeHelper.getColorSchemeName(
        ColorSchemeType.dynamic,
      );
      expect(name, 'Dynamic Colors');
    });

    test('getColorSchemeName returns correct name for blue', () {
      final String name = ColorSchemeHelper.getColorSchemeName(
        ColorSchemeType.blue,
      );
      expect(name, 'Blue');
    });

    test('getColorSchemeName returns correct name for green', () {
      final String name = ColorSchemeHelper.getColorSchemeName(
        ColorSchemeType.green,
      );
      expect(name, 'Green');
    });

    test('getColorSchemeName returns correct name for red', () {
      final String name = ColorSchemeHelper.getColorSchemeName(
        ColorSchemeType.red,
      );
      expect(name, 'Red');
    });

    test('getColorSchemeName returns correct name for purple', () {
      final String name = ColorSchemeHelper.getColorSchemeName(
        ColorSchemeType.purple,
      );
      expect(name, 'Purple');
    });

    test('getColorSchemeName returns correct name for orange', () {
      final String name = ColorSchemeHelper.getColorSchemeName(
        ColorSchemeType.orange,
      );
      expect(name, 'Orange');
    });
  });
}
