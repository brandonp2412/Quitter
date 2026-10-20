import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/quit_card.dart';

void main() {
  const colors = [Color(0xFF6655DD), Color(0xFFAA55DD)];

  for (final brightness in [Brightness.light, Brightness.dark]) {
    testWidgets('card has one smooth tinted surface in $brightness', (
      tester,
    ) async {
      var taps = 0;
      final scheme = ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: brightness,
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(colorScheme: scheme),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 180,
                height: 240,
                child: QuitCard(
                  title: 'Alcohol',
                  heroTag: 'alcohol',
                  icon: Icons.local_bar,
                  gradientColors: colors,
                  quitDate: '2025-09-20',
                  onTap: () => taps++,
                ),
              ),
            ),
          ),
        ),
      );

      final cardFinder = find.byType(QuitCard);
      final material = tester.widget<Material>(
        find.descendant(of: cardFinder, matching: find.byType(Material)),
      );
      final shape = material.shape! as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(20));
      expect(shape.side, BorderSide.none);
      expect(material.clipBehavior, Clip.antiAlias);
      expect(
        find.descendant(of: cardFinder, matching: find.byType(Card)),
        findsNothing,
      );

      final ink = tester.widget<Ink>(
        find.descendant(of: cardFinder, matching: find.byType(Ink)),
      );
      final decoration = ink.decoration! as BoxDecoration;
      expect(decoration.border, isNull);
      expect(decoration.boxShadow, isNull);
      expect(
        (decoration.gradient! as LinearGradient).colors,
        colors
            .map(
              (color) => Color.alphaBlend(scheme.surface.withAlpha(229), color),
            )
            .toList(),
      );

      await tester.tap(
        find.descendant(of: cardFinder, matching: find.byType(InkWell)),
      );
      expect(taps, 1);
    });
  }
}
