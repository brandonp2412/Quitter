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
  testWidgets('nicotine pouches use route-neutral early withdrawal claims', (
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
    expect(page.milestones.map((milestone) => milestone.day).toList(), [
      1,
      3,
      7,
      14,
      730,
      1095,
      1460,
      1825,
    ]);

    final day1 = page.milestones.singleWhere((milestone) => milestone.day == 1);
    final day3 = page.milestones.singleWhere((milestone) => milestone.day == 3);
    final day7 = page.milestones.singleWhere((milestone) => milestone.day == 7);
    final day14 = page.milestones.singleWhere(
      (milestone) => milestone.day == 14,
    );

    expect(day1.title, 'First day pouch-free');
    expect(day1.description, contains('withdrawal can begin within hours'));
    expect(day1.link, 'https://pubmed.ncbi.nlm.nih.gov/25638335/');
    expect(day1.referenceContent, isNot(contains('carbon monoxide')));

    expect(day3.title, 'The cravings are loud');
    expect(day3.description, contains('peaks around day three'));
    expect(day3.link, 'https://pubmed.ncbi.nlm.nih.gov/25638335/');
    expect(day3.referenceContent, isNot(contains('airways')));
    expect(day3.referenceContent, isNot(contains("doesn't get worse")));

    expect(day7.title, 'A week without pouches');
    expect(day7.description, contains('early nicotine-withdrawal peak'));
    expect(day7.link, 'https://pubmed.ncbi.nlm.nih.gov/25638335/');
    expect(day7.referenceContent, contains('into the taper phase'));
    expect(day7.referenceContent, isNot(contains('airways')));
    expect(day7.referenceContent, isNot(contains('taste and smell')));

    expect(day14.title, 'Two weeks clear');
    expect(day14.description, contains('eases over the first few weeks'));
    expect(day14.link, 'https://pubmed.ncbi.nlm.nih.gov/25638335/');
    expect(day14.referenceContent, contains('post-peak taper window'));
    expect(day14.referenceContent, isNot(contains('carbon monoxide')));
    expect(day14.referenceContent, isNot(contains('cilia')));
  });
}
