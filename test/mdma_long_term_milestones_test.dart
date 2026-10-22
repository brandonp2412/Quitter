import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/mdma_page.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'MDMA milestones preserve evidence wiring and long-term anniversaries',
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
            home: MdmaPage(started: false),
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

      const earlySource = 'https://pmc.ncbi.nlm.nih.gov/articles/PMC3931692/';
      const transporterSource = 'https://pubmed.ncbi.nlm.nih.gov/34506649/';
      const longTermSource = 'https://pubmed.ncbi.nlm.nih.gov/41255336/';
      const expectedLinks = {
        1: earlySource,
        3: earlySource,
        7: earlySource,
        14: earlySource,
        30: transporterSource,
        90: transporterSource,
        365: transporterSource,
        730: longTermSource,
        1095: longTermSource,
        1460: longTermSource,
        1825: longTermSource,
      };
      for (final entry in expectedLinks.entries) {
        final milestone = page.milestones.singleWhere(
          (milestone) => milestone.day == entry.key,
        );
        expect(milestone.link, entry.value);
        expect(milestone.localizedReferenceContent, isNotEmpty);
      }

      const expectedTitles = {
        730: 'Two years',
        1095: 'Three years, no comeback',
        1460: 'Four years of follow-through',
        1825: 'Five years without MDMA',
      };
      for (final entry in expectedTitles.entries) {
        final milestone = page.milestones.singleWhere(
          (milestone) => milestone.day == entry.key,
        );
        expect(milestone.title, entry.value);
        expect(milestone.title.runes.length, lessThanOrEqualTo(36));
        expect(milestone.description, isNotEmpty);
        expect(
          milestone.reference,
          'Ung et al. (2026) - MDMA neurocognition review',
        );
        expect(milestone.referenceContent, isNotEmpty);
        expect(
          milestone.referenceContent!.toLowerCase(),
          anyOf(
            contains('does not'),
            contains('do not'),
            contains('limited'),
            contains('low quality'),
          ),
        );
      }
    },
  );

  test('all supported ARBs localize every MDMA milestone', () {
    const days = [1, 3, 7, 14, 30, 90, 365, 730, 1095, 1460, 1825];
    final arbFiles =
        Directory('lib/l10n')
            .listSync()
            .whereType<File>()
            .where((file) => RegExp(r'app_[^/]+\.arb$').hasMatch(file.path))
            .toList()
          ..sort((a, b) => a.path.compareTo(b.path));

    expect(arbFiles, hasLength(17));
    final english =
        jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
            as Map<String, dynamic>;

    for (final file in arbFiles) {
      final locale = file.uri.pathSegments.last
          .replaceFirst('app_', '')
          .replaceFirst('.arb', '');
      final arb = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;

      for (final day in days) {
        for (final suffix in ['Title', 'Description']) {
          final key = 'mdmaMilestone$day$suffix';
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

        final referenceKey = 'mdmaReferenceDay$day';
        final reference = arb[referenceKey];
        expect(
          reference,
          isA<String>().having(
            (value) => value.trim(),
            referenceKey,
            isNotEmpty,
          ),
          reason: '$locale must localize $referenceKey',
        );
        if (locale != 'en') {
          expect(
            reference,
            isNot(equals(english[referenceKey])),
            reason: '$locale must not fall back to English for $referenceKey',
          );
        }

        final englishReference = english[referenceKey] as String;
        final localizedReference = reference as String;
        expect(
          localizedReference.split('\n\n').length,
          englishReference.split('\n\n').length,
          reason: '$locale must preserve paragraph structure for $referenceKey',
        );
        expect(
          localizedReference
              .split('\n')
              .where((line) => line.startsWith('•'))
              .length,
          englishReference
              .split('\n')
              .where((line) => line.startsWith('•'))
              .length,
          reason: '$locale must preserve bullet structure for $referenceKey',
        );
      }
    }
  });

  test('MDMA translations reject known machine-translation artifacts', () {
    const forbiddenByLocale = <String, List<String>>{
      'ar': [
        'الامتناع عن ممارسة الجنس',
        'الامتناع عن التدخين',
        'سنة واحدة مجانية',
        'الكوميديا',
      ],
      'de': [
        'Heißhunger',
        'Rücknahme',
        'Wiederfindungssignal',
        'Wo ein Monat sitzt',
      ],
      'id': [
        'Informasi referensi pemulihan dalam bahasa Indonesia',
        'Komedo',
        'Gratis Satu Tahun',
      ],
      'pl': [
        'The Midweek Blues',
        'Trzy miesiące Off MDMA',
        'Hydraulika',
        'nastroje i energii',
      ],
      'pt': ['desmaio'],
      'pt_BR': [
        'desmaio',
        'folga no MDMA',
        'desconto em MDMA',
        'Um ano grátis',
      ],
      'ru': ['одноразового снижения дозы'],
      'th': ['เลิกบุหรี่', 'ความอยากอาหาร', 'ส่วนลด MDMA', 'ฟรีหนึ่งปี'],
      'ur': ['آذربائیجان', 'مریخ', 'Hydration', 'دو رنگ'],
    };

    for (final entry in forbiddenByLocale.entries) {
      final arb =
          jsonDecode(File('lib/l10n/app_${entry.key}.arb').readAsStringSync())
              as Map<String, dynamic>;
      final mdmaText = arb.entries
          .where(
            (item) =>
                item.key.startsWith('mdmaMilestone') ||
                item.key.startsWith('mdmaReferenceDay'),
          )
          .map((item) => item.value)
          .whereType<String>()
          .join('\n');

      for (final fragment in entry.value) {
        expect(
          mdmaText,
          isNot(contains(fragment)),
          reason: '${entry.key} must not contain machine artifact "$fragment"',
        );
      }
    }
  });
}
