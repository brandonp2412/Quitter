import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/kratom_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'Kratom milestones include unique sorted long-term anniversaries',
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
            home: KratomPage(started: false),
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
        730: 'Two years',
        1095: 'Three years of your own',
        1460: 'Four years, still clear',
        1825: 'Five years',
      };
      const source = 'https://pubmed.ncbi.nlm.nih.gov/33974767/';

      final descriptions = <String>{};
      for (final entry in expectedTitles.entries) {
        final milestone = page.milestones.singleWhere(
          (milestone) => milestone.day == entry.key,
        );
        expect(milestone.title, entry.value);
        expect(milestone.title.runes.length, lessThanOrEqualTo(36));
        expect(milestone.description, isNotEmpty);
        descriptions.add(milestone.description);
        expect(
          milestone.reference,
          'Stanciu et al. (2021) - Kratom Use Disorder Management (PubMed)',
        );
        expect(milestone.link, source);
        expect(milestone.referenceContent, contains('long-term'));
        expect(milestone.localizedReferenceContent, isNotEmpty);
      }
      expect(descriptions, hasLength(4));

      const expectedLinks = {
        1: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC8924421/',
        3: 'https://pubmed.ncbi.nlm.nih.gov/24698080/',
        7: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC8924421/',
        14: 'https://nida.nih.gov/research-topics/kratom',
        30: 'https://nida.nih.gov/research-topics/kratom',
        90: 'https://nida.nih.gov/research-topics/kratom',
        365: 'https://nida.nih.gov/research-topics/kratom',
        730: source,
        1095: source,
        1460: source,
        1825: source,
      };
      for (final entry in expectedLinks.entries) {
        final milestone = page.milestones.singleWhere(
          (milestone) => milestone.day == entry.key,
        );
        expect(milestone.link, entry.value);
        expect(milestone.localizedReferenceContent, isNotEmpty);
      }
    },
  );

  test('all supported ARBs fully localize kratom milestones', () {
    const days = [1, 3, 7, 14, 30, 90, 365, 730, 1095, 1460, 1825];
    final arbFiles =
        Directory('lib/l10n')
            .listSync()
            .whereType<File>()
            .where((file) => RegExp(r'app_[^/]+\.arb$').hasMatch(file.path))
            .toList()
          ..sort((a, b) => a.path.compareTo(b.path));

    expect(arbFiles, isNotEmpty);
    final english =
        jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
            as Map<String, dynamic>;

    int paragraphCount(String value) =>
        value.trim().split(RegExp(r'\n\s*\n')).length;
    int bulletCount(String value) =>
        RegExp(r'^•\s', multiLine: true).allMatches(value).length;

    const knownBadFragments = <String, List<String>>{
      'ar': [
        'الامتناع عن ممارسة الجنس',
        'سنة واحدة مجانية',
        'الرغبة الشديدة في تناول الطعام',
      ],
      'de': [
        'Getting Through It',
        'Ein Reward System Recovering',
        'Heißhunger',
        'Ein Monat vor Kratom',
      ],
      'id': [
        'Informasi referensi pemulihan',
        'Gratis Satu Tahun',
        'frekuensi ngemil',
      ],
      'ko': ['철수', '할인', '무료', '금주'],
      'pl': ['Withdrawall', 'wycofywania', 'Wyczyść miesiąc', 'krytomu'],
      'pt_BR': ['grátis', 'desconto', 'folga no Kratom', 'folga no kratom'],
      'th': ['ถอนเงิน', 'ฟรี', 'เลิกบุหรี่', 'ความอยากอาหารอย่างรุนแรง'],
      'ur': ['یہوواہ', 'کرس‌ٹینا', 'آذربائیجان', 'دو موسمِ‌گرما'],
    };

    for (final file in arbFiles) {
      final locale = file.uri.pathSegments.last
          .replaceFirst('app_', '')
          .replaceFirst('.arb', '');
      final arb = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;

      for (final day in days) {
        for (final suffix in ['Title', 'Description']) {
          final key = 'kratomMilestone$day$suffix';
          expect(
            arb[key],
            isA<String>().having((value) => value.trim(), key, isNotEmpty),
            reason: '$locale must localize $key',
          );
          if (suffix == 'Title') {
            expect(
              (arb[key] as String).runes.length,
              lessThanOrEqualTo(36),
              reason: '$locale must keep $key compact for phone layouts',
            );
          }
          if (locale != 'en') {
            expect(
              arb[key],
              isNot(equals(english[key])),
              reason: '$locale must not fall back to English for $key',
            );
          }
        }

        final referenceKey = 'kratomReferenceDay$day';
        expect(
          arb[referenceKey],
          isA<String>().having(
            (value) => value.trim(),
            referenceKey,
            isNotEmpty,
          ),
          reason: '$locale must localize $referenceKey',
        );

        final reference = arb[referenceKey] as String;
        final englishReference = english[referenceKey] as String;
        expect(
          paragraphCount(reference),
          paragraphCount(englishReference),
          reason:
              '$locale must preserve the section structure of $referenceKey',
        );
        expect(
          bulletCount(reference),
          bulletCount(englishReference),
          reason: '$locale must preserve the bullet structure of $referenceKey',
        );

        if (locale != 'en') {
          expect(
            reference,
            isNot(equals(englishReference)),
            reason: '$locale must not fall back to English for $referenceKey',
          );
        }
      }

      final kratomText = [
        for (final entry in arb.entries)
          if (entry.key.startsWith('kratomMilestone') ||
              entry.key.startsWith('kratomReference'))
            entry.value,
      ].join('\n');
      for (final fragment in knownBadFragments[locale] ?? const <String>[]) {
        expect(
          kratomText,
          isNot(contains(fragment)),
          reason:
              '$locale must not reintroduce known mistranslation: $fragment',
        );
      }
    }
  });
}
