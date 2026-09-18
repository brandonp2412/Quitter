import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/milestone_reference_page.dart';
import 'package:quitter/quit_milestone.dart';

void main() {
  testWidgets('uses localized reference content when available', (
    WidgetTester tester,
  ) async {
    const milestone = QuitMilestone(
      day: 1,
      title: '節目',
      description: '説明',
      reference: 'Reference',
      link: 'https://example.com',
      referenceContent: 'English title\n\nEnglish body',
      localizedReferenceContent: '日本語タイトル\n\n日本語本文',
    );

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ja'),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: MilestoneReferencePage(milestone: milestone),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('日本語タイトル'), findsOneWidget);
    expect(find.text('日本語本文'), findsOneWidget);
    expect(find.text('English title'), findsNothing);
    expect(find.text('English body'), findsNothing);
  });
}
