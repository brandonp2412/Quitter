import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/ketamine_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'Ketamine milestones include unique sorted long-term anniversaries',
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
            home: KetaminePage(started: false),
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
        730: 'Two Years, Still Clear',
        1095: 'Three Years of Distance',
        1460: 'Four Years. Nice.',
        1825: 'Five Years. That\'s Big.',
      };
      const source = 'https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/';

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
          'Ketamine-Induced Cystitis: A Comprehensive Review (PMC)',
        );
        expect(milestone.link, source);
        expect(milestone.referenceContent, contains('ketamine'));
        expect(milestone.localizedReferenceContent, isNotEmpty);
      }
      expect(descriptions, hasLength(4));
    },
  );

  test('all supported ARBs fully localize ketamine milestones', () {
    const days = [1, 7, 14, 30, 90, 180, 365, 730, 1095, 1460, 1825];
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
      'ar': ['الامتناع عن ممارسة الجنس', 'مجاناً'],
      'de': ['Systemfreigabe', 'Heißhunger', 'Wiederfindungssignal'],
      'id': ['Informasi referensi pemulihan', 'Gratis ', 'Kliring Sistem'],
      'ko': ['할인', '무료', '금주'],
      'pl': ['z drawal', 'za darmo', 'cessation', 'outcome'],
      'pt_BR': ['grátis', 'folga com cetamina'],
      'th': ['ความอยากอาหาร', 'ฟรี', 'เลิกบุหรี่'],
      'ur': ['یہوواہ', 'مُنادی', 'کرسٹینا', 'خود کشی'],
    };

    for (final file in arbFiles) {
      final locale = file.uri.pathSegments.last
          .replaceFirst('app_', '')
          .replaceFirst('.arb', '');
      final arb = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;

      for (final day in days) {
        for (final suffix in ['Title', 'Description']) {
          final key = 'ketamineMilestone$day$suffix';
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

        final referenceKey = 'ketamineReferenceDay$day';
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

      final ketamineText = [
        for (final entry in arb.entries)
          if (entry.key.startsWith('ketamineMilestone') ||
              entry.key.startsWith('ketamineReference'))
            entry.value,
      ].join('\\n');
      for (final fragment in knownBadFragments[locale] ?? const <String>[]) {
        expect(
          ketamineText,
          isNot(contains(fragment)),
          reason:
              '$locale must not reintroduce known mistranslation: $fragment',
        );
      }
    }
  });
}
