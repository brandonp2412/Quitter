import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

import 'package:quitter/color_picker.dart';

void main() {
  testWidgets('custom colour is last and accepts typed hex', (tester) async {
    Color selected = Colors.red;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: ColorPickerWidget(
            selectedColor: selected,
            onColorSelected: (color) => selected = color,
          ),
        ),
      ),
    );

    final swatch = find.byKey(const Key('customColorSwatch'));
    expect(swatch, findsOneWidget);
    await tester.ensureVisible(swatch);
    await tester.tap(swatch);
    await tester.pumpAndSettle();

    expect(find.text('Custom Color'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('hexColorField')), '#12AB34');
    await tester.pump();
    await tester.tap(find.byKey(const Key('applyCustomColor')));
    await tester.pumpAndSettle();

    expect(selected.toARGB32(), 0xFF12AB34);
    expect(find.text('Custom Color'), findsNothing);
  });

  testWidgets('invalid hex cannot be applied and visual picker works', (
    tester,
  ) async {
    Color selected = Colors.blue;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: ColorPickerWidget(
            selectedColor: selected,
            onColorSelected: (color) => selected = color,
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('customColorSwatch')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('hexColorField')), '#NOTHEX');
    await tester.pump();
    final apply = find.byKey(const Key('applyCustomColor'));
    expect(tester.widget<FilledButton>(apply).onPressed, isNull);

    await tester.drag(find.byKey(const Key('hueSlider')), const Offset(80, 0));
    await tester.pump();
    expect(tester.widget<FilledButton>(apply).onPressed, isNotNull);
    await tester.tap(apply);
    await tester.pumpAndSettle();
    expect(selected.toARGB32(), isNot(Colors.blue.toARGB32()));
  });
}
