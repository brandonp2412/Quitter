import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/cocaine_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'Cocaine milestones include unique sorted long-term anniversaries',
    (tester) async {
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
            home: CocainePage(started: false),
          ),
        ),
      );
      await tester.pump();

      final page = tester.widget<QuitMilestonesPage>(
        find.byType(QuitMilestonesPage),
      );
      final days = page.milestones.map((milestone) => milestone.day).toList();
      final sortedDays = [...days]..sort();

      expect(days, orderedEquals(sortedDays));
      expect(days.toSet(), hasLength(days.length));
      expect(days, containsAllInOrder([730, 1095, 1460, 1825]));

      const expectedTitles = {
        730: 'Two years without cocaine',
        1095: 'Three years',
        1460: 'Four years, still clear',
        1825: 'Five years',
      };
      const source =
          'https://www.samhsa.gov/resource/ebp/treatment-stimulant-use-disorders';

      final descriptions = <String>{};
      for (final entry in expectedTitles.entries) {
        final milestone = page.milestones.singleWhere(
          (milestone) => milestone.day == entry.key,
        );
        expect(milestone.title, entry.value);
        expect(milestone.title.runes.length, lessThanOrEqualTo(36));
        expect(milestone.description, isNotEmpty);
        descriptions.add(milestone.description);
        if (entry.key > 730) {
          expect(
            milestone.reference,
            'SAMHSA Treatment of Stimulant Use Disorders',
          );
          expect(milestone.link, source);
          expect(milestone.referenceContent, contains('SAMHSA'));
        }
        expect(milestone.localizedReferenceContent, isNotEmpty);
      }
      expect(descriptions, hasLength(4));
    },
  );

  test(
    'cocaine two-to-five-year copy exists in every supported locale',
    () async {
      final english = await AppLocalizations.delegate.load(const Locale('en'));

      for (final locale in AppLocalizations.supportedLocales) {
        final l10n = await AppLocalizations.delegate.load(locale);
        final tag = locale.toLanguageTag();

        final localizedValues = [
          l10n.cocaineMilestone730Title,
          l10n.cocaineMilestone730Description,
          l10n.cocaineReferenceDay730,
          l10n.cocaineMilestone1095Title,
          l10n.cocaineMilestone1095Description,
          l10n.cocaineReferenceDay1095,
          l10n.cocaineMilestone1460Title,
          l10n.cocaineMilestone1460Description,
          l10n.cocaineReferenceDay1460,
          l10n.cocaineMilestone1825Title,
          l10n.cocaineMilestone1825Description,
          l10n.cocaineReferenceDay1825,
        ];
        for (final value in localizedValues) {
          expect(value, isNotEmpty, reason: 'localized cocaine copy for $tag');
        }

        if (locale.languageCode == 'en') {
          continue;
        }

        expect(
          l10n.cocaineMilestone730Title,
          isNot(english.cocaineMilestone730Title),
          reason: '2-year title should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineMilestone730Description,
          isNot(english.cocaineMilestone730Description),
          reason: '2-year description should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineReferenceDay730,
          isNot(english.cocaineReferenceDay730),
          reason: '2-year reference should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineMilestone1095Title,
          isNot(english.cocaineMilestone1095Title),
          reason: '3-year title should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineMilestone1095Description,
          isNot(english.cocaineMilestone1095Description),
          reason: '3-year description should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineReferenceDay1095,
          isNot(english.cocaineReferenceDay1095),
          reason: '3-year reference should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineMilestone1460Title,
          isNot(english.cocaineMilestone1460Title),
          reason: '4-year title should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineMilestone1460Description,
          isNot(english.cocaineMilestone1460Description),
          reason: '4-year description should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineReferenceDay1460,
          isNot(english.cocaineReferenceDay1460),
          reason: '4-year reference should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineMilestone1825Title,
          isNot(english.cocaineMilestone1825Title),
          reason: '5-year title should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineMilestone1825Description,
          isNot(english.cocaineMilestone1825Description),
          reason: '5-year description should not fall back to English for $tag',
        );
        expect(
          l10n.cocaineReferenceDay1825,
          isNot(english.cocaineReferenceDay1825),
          reason: '5-year reference should not fall back to English for $tag',
        );
      }
    },
  );
}
