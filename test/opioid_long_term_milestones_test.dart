import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('opioid milestones include unique sorted long-term anniversaries', (
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
          home: OpioidPage(started: false),
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
      1095: 'Three Years - Recovery Endures',
      1460: 'Four Years - Strong Foundation',
      1825: 'Five Years - Half a Decade',
    };
    const source =
        'https://www.cdc.gov/overdose-prevention/treatment/opioid-use-disorder.html';

    final descriptions = <String>{};
    for (final entry in expectedTitles.entries) {
      final milestone = page.milestones.singleWhere(
        (milestone) => milestone.day == entry.key,
      );
      expect(milestone.title, entry.value);
      expect(milestone.title.runes.length, lessThanOrEqualTo(36));
      expect(milestone.description, isNotEmpty);
      descriptions.add(milestone.description);
      expect(milestone.localizedReferenceContent, isNotEmpty);
      expect(milestone.reference, 'Treatment of Opioid Use Disorder (CDC)');
      expect(milestone.link, source);
      expect(milestone.referenceContent, isNotNull);
      final referenceContent = milestone.referenceContent!.toLowerCase();
      expect(referenceContent, contains('recovery'));
      expect(referenceContent, contains('cdc'));
      expect(referenceContent, isNot(contains('fully recovered')));
      expect(referenceContent, isNot(contains('biologically complete at')));
    }
    expect(descriptions, hasLength(3));
  });

  test(
    'opioid two-to-five-year copy exists in every supported locale',
    () async {
      final english = await AppLocalizations.delegate.load(const Locale('en'));

      for (final locale in AppLocalizations.supportedLocales) {
        final l10n = await AppLocalizations.delegate.load(locale);
        final tag = locale.toLanguageTag();

        final localizedValues = [
          l10n.opioidMilestone730Title,
          l10n.opioidMilestone730Description,
          l10n.opioidReferenceDay730,
          l10n.opioidMilestone1095Title,
          l10n.opioidMilestone1095Description,
          l10n.opioidReferenceDay1095,
          l10n.opioidMilestone1460Title,
          l10n.opioidMilestone1460Description,
          l10n.opioidReferenceDay1460,
          l10n.opioidMilestone1825Title,
          l10n.opioidMilestone1825Description,
          l10n.opioidReferenceDay1825,
        ];
        for (final value in localizedValues) {
          expect(value, isNotEmpty, reason: 'localized opioid copy for $tag');
        }

        if (locale.languageCode == 'en') continue;

        expect(
          l10n.opioidMilestone730Title,
          isNot(english.opioidMilestone730Title),
          reason: '2-year title should not fall back to English for $tag',
        );
        expect(
          l10n.opioidMilestone730Description,
          isNot(english.opioidMilestone730Description),
          reason: '2-year description should not fall back to English for $tag',
        );
        expect(
          l10n.opioidReferenceDay730,
          isNot(english.opioidReferenceDay730),
          reason: '2-year reference should not fall back to English for $tag',
        );
        expect(
          l10n.opioidMilestone1095Title,
          isNot(english.opioidMilestone1095Title),
          reason: '3-year title should not fall back to English for $tag',
        );
        expect(
          l10n.opioidMilestone1095Description,
          isNot(english.opioidMilestone1095Description),
          reason: '3-year description should not fall back to English for $tag',
        );
        expect(
          l10n.opioidReferenceDay1095,
          isNot(english.opioidReferenceDay1095),
          reason: '3-year reference should not fall back to English for $tag',
        );
        expect(
          l10n.opioidMilestone1460Title,
          isNot(english.opioidMilestone1460Title),
          reason: '4-year title should not fall back to English for $tag',
        );
        expect(
          l10n.opioidMilestone1460Description,
          isNot(english.opioidMilestone1460Description),
          reason: '4-year description should not fall back to English for $tag',
        );
        expect(
          l10n.opioidReferenceDay1460,
          isNot(english.opioidReferenceDay1460),
          reason: '4-year reference should not fall back to English for $tag',
        );
        expect(
          l10n.opioidMilestone1825Title,
          isNot(english.opioidMilestone1825Title),
          reason: '5-year title should not fall back to English for $tag',
        );
        expect(
          l10n.opioidMilestone1825Description,
          isNot(english.opioidMilestone1825Description),
          reason: '5-year description should not fall back to English for $tag',
        );
        expect(
          l10n.opioidReferenceDay1825,
          isNot(english.opioidReferenceDay1825),
          reason: '5-year reference should not fall back to English for $tag',
        );
      }
    },
  );

  test(
    'opioid translations avoid known machine-translation artifacts',
    () async {
      final indonesian = await AppLocalizations.delegate.load(
        const Locale('id'),
      );
      final polish = await AppLocalizations.delegate.load(const Locale('pl'));
      final thai = await AppLocalizations.delegate.load(const Locale('th'));
      final urdu = await AppLocalizations.delegate.load(const Locale('ur'));
      final arabic = await AppLocalizations.delegate.load(const Locale('ar'));
      final korean = await AppLocalizations.delegate.load(const Locale('ko'));
      final brazilianPortuguese = await AppLocalizations.delegate.load(
        const Locale('pt', 'BR'),
      );

      expect(
        indonesian.opioidReferenceDay730,
        isNot(contains('Informasi referensi pemulihan dalam bahasa Indonesia')),
      );

      final polishCopy = [
        polish.opioidMilestone365Title,
        polish.opioidReferenceDay30,
        polish.opioidReferenceDay90,
        polish.opioidReferenceDay180,
        polish.opioidReferenceDay365,
        polish.opioidReferenceDay730,
      ].join('\n');
      expect(polishCopy, isNot(contains('Off Opioids')));
      expect(polishCopy, isNot(contains('Neural Plasticity Brain')));
      expect(polishCopy, isNot(contains('on PubMed')));

      final thaiCopy = [
        thai.opioidReferenceDay1,
        thai.opioidReferenceDay7,
        thai.opioidReferenceDay60,
        thai.opioidReferenceDay90,
        thai.opioidReferenceDay180,
        thai.opioidReferenceDay365,
        thai.opioidReferenceDay730,
      ].join('\n');
      expect(thaiCopy, isNot(contains('เลิกบุหรี่')));
      expect(thaiCopy, isNot(contains('ความอยากอาหาร')));

      final urduCopy = [
        urdu.opioidReferenceDay1,
        urdu.opioidReferenceDay180,
        urdu.opioidReferenceDay730,
      ].join('\n');
      expect(urduCopy, isNot(contains('access-date')));
      expect(urduCopy, isNot(contains('archive-date')));
      expect(urduCopy, isNot(contains('اوکاڑہ')));

      final arabicCopy = [
        arabic.opioidReferenceDay1,
        arabic.opioidReferenceDay60,
        arabic.opioidReferenceDay90,
        arabic.opioidReferenceDay180,
        arabic.opioidReferenceDay365,
      ].join('\n');
      expect(arabicCopy, isNot(contains('الامتناع عن ممارسة الجنس')));

      final koreanCopy = [
        korean.opioidReferenceDay1,
        korean.opioidReferenceDay30,
        korean.opioidReferenceDay90,
        korean.opioidReferenceDay180,
        korean.opioidReferenceDay365,
        korean.opioidReferenceDay730,
      ].join('\n');
      expect(koreanCopy, isNot(contains('금주')));

      expect(
        brazilianPortuguese.opioidReferenceDay365,
        isNot(contains('folga em opioides')),
      );
    },
  );
}
