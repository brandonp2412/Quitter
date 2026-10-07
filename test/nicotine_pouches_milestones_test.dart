import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('nicotine pouches use route-neutral day 1 and day 3 claims', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});

    final settings = SettingsProvider();
    await settings.loadPreferences();
    final addictions = AddictionProvider();
    await addictions.loadAddictions();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsProvider>.value(value: settings),
          ChangeNotifierProvider<AddictionProvider>.value(value: addictions),
        ],
        child: const MaterialApp(
          locale: Locale('en'),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: NicotinePouchesPage(started: false),
        ),
      ),
    );

    await tester.pump();

    final page = tester.widget<QuitMilestonesPage>(
      find.byType(QuitMilestonesPage),
    );
    final day1 = page.milestones.singleWhere((milestone) => milestone.day == 1);
    final day3 = page.milestones.singleWhere((milestone) => milestone.day == 3);

    expect(day1.title, 'Withdrawal Is Underway');
    expect(day1.description, contains('4–24 hours'));
    expect(day1.link, 'https://pubmed.ncbi.nlm.nih.gov/25638335/');
    expect(day1.referenceContent, isNot(contains('carbon monoxide')));

    expect(day3.title, 'Withdrawal Peaks');
    expect(day3.description, contains('3–4 weeks'));
    expect(day3.link, 'https://pubmed.ncbi.nlm.nih.gov/25638335/');
    expect(day3.referenceContent, isNot(contains('airways')));
    expect(day3.referenceContent, isNot(contains("doesn't get worse")));
  });
}
