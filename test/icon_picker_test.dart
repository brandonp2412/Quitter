import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quitter/addiction_icon.dart';
import 'package:quitter/icon_picker.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

void main() {
  testWidgets('icon picker only displays one copy of each matching glyph', (
    tester,
  ) async {
    IconData? selectedIcon;
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
          body: IconPickerWidget(onIconSelected: (icon) => selectedIcon = icon),
        ),
      ),
    );

    await tester.enterText(find.byType(SearchBar), 'cut');
    await tester.pumpAndSettle();

    final scissors = find.byWidgetPredicate(
      (widget) => widget is AddictionIcon && widget.icon == Icons.content_cut,
    );
    expect(Icons.cut, Icons.content_cut);
    expect(scissors, findsOneWidget);

    await tester.tap(scissors);
    expect(selectedIcon, Icons.content_cut);

    await tester.enterText(find.byType(SearchBar), 'content_cut');
    await tester.pumpAndSettle();
    expect(scissors, findsOneWidget);
  });
}
