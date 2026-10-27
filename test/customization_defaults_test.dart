import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

import 'package:quitter/addiction_provider.dart';
import 'package:quitter/color_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('clearing preset appearance restores defaults after reload', () async {
    SharedPreferences.setMockInitialValues({});
    final provider = AddictionProvider();
    await provider.loadAddictions();
    await provider.setCustomIcon('smoking', Icons.star);
    await provider.setCustomColor('smoking', Colors.blue);
    await provider.setCustomIcon('smoking', null);
    await provider.setCustomColor('smoking', null);

    final reloaded = AddictionProvider();
    await reloaded.loadAddictions();
    expect(reloaded.customIcons, isNot(contains('smoking')));
    expect(reloaded.customColors, isNot(contains('smoking')));
  });

  testWidgets('marks a default shade outside the standard palette', (
    tester,
  ) async {
    final selected = Colors.blue.shade700;
    Color? picked;
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
            onColorSelected: (color) => picked = color,
          ),
        ),
      ),
    );

    final customSwatch = find.byKey(const Key('customColorSwatch'));
    expect(customSwatch, findsOneWidget);
    final swatch = tester.widget<Container>(
      find.descendant(of: customSwatch, matching: find.byType(Container)).first,
    );
    expect((swatch.decoration! as BoxDecoration).color, selected);

    await tester.tap(customSwatch);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('hexColorField')), findsOneWidget);
    await tester.tap(find.byKey(const Key('applyCustomColor')));
    await tester.pumpAndSettle();
    expect(picked, selected);
  });
}
