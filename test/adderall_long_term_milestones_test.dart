import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/adderall_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'Adderall milestones include unique sorted long-term anniversaries',
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
            home: AdderallPage(started: false),
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
        730: 'Two years without misuse',
        1095: 'Three years of progress',
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
        expect(milestone.title.length, lessThanOrEqualTo(32));
        expect(milestone.description, isNotEmpty);
        descriptions.add(milestone.description);
        expect(
          milestone.reference,
          'Treatment of Stimulant Use Disorders (SAMHSA)',
        );
        expect(milestone.link, source);
        expect(milestone.referenceContent, contains('SAMHSA'));
        expect(milestone.localizedReferenceContent, isNotEmpty);
      }
      expect(descriptions, hasLength(4));
    },
  );

  test('all supported ARBs localize every Adderall milestone', () {
    const days = [1, 3, 7, 14, 30, 60, 90, 180, 365, 730, 1095, 1460, 1825];
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

    for (final file in arbFiles) {
      final locale = file.uri.pathSegments.last
          .replaceFirst('app_', '')
          .replaceFirst('.arb', '');
      final arb = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;

      for (final day in days) {
        for (final suffix in ['Title', 'Description']) {
          final key = 'adderallMilestone$day$suffix';
          expect(
            arb[key],
            isA<String>().having((value) => value.trim(), key, isNotEmpty),
            reason: '$locale must localize $key',
          );
          if (suffix == 'Title') {
            expect(
              (arb[key] as String).runes.length,
              lessThanOrEqualTo(44),
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

        final referenceKey = 'adderallReferenceDay$day';
        expect(
          arb[referenceKey],
          isA<String>().having(
            (value) => value.trim(),
            referenceKey,
            isNotEmpty,
          ),
          reason: '$locale must localize $referenceKey',
        );
        if (locale != 'en') {
          expect(
            arb[referenceKey],
            isNot(equals(english[referenceKey])),
            reason: '$locale must not fall back to English for $referenceKey',
          );
        }

        final englishReference = english[referenceKey] as String;
        final localizedReference = arb[referenceKey] as String;
        expect(
          '\n\n'.allMatches(localizedReference).length,
          '\n\n'.allMatches(englishReference).length,
          reason: '$locale must preserve paragraph structure for $referenceKey',
        );
        expect(
          '•'.allMatches(localizedReference).length,
          '•'.allMatches(englishReference).length,
          reason: '$locale must preserve evidence bullets for $referenceKey',
        );
      }
    }
  });

  test('Adderall translations reject known fallback and machine artifacts', () {
    const forbiddenByLocale = <String, List<String>>{
      'ar': [
        'الامتناع عن ممارسة الجنس',
        'الامتناع عن التدخين',
        'الرغبة الشديدة في تناول الطعام',
      ],
      'de': [
        'Auszahlung beginnt',
        'Spitzenrücknahme',
        'Brain Chemistry Rebalancing',
        'Off Adderall',
      ],
      'id': [
        'Informasi referensi pemulihan dalam bahasa Indonesia.',
        'Sumber: sumber kesehatan publik dan penelitian terkait.',
      ],
      'ko': ['출금 시작', '최대 철수', '휴가 Adderall', '할인'],
      'pl': [
        'AdderallZ',
        'AdderallZZ',
        'Major Recovery Milestone',
        'temporary',
        'intensity',
      ],
      'pt_BR': ['de folga em Adderall'],
      'ru': ['Месячный перерыв на Аддерол', 'Годовой перерыв в Adderall'],
      'th': ['การถอนเงิน', 'ลดราคา', 'การเลิกบุหรี่'],
      'ur': ['دُنیا کا خاتمہ', 'ممتاز ریٹائرڈ', 'ابی‌سلوم'],
    };

    for (final entry in forbiddenByLocale.entries) {
      final arb =
          jsonDecode(File('lib/l10n/app_${entry.key}.arb').readAsStringSync())
              as Map<String, dynamic>;
      final adderallText = arb.entries
          .where((entry) => entry.key.startsWith('adderall'))
          .map((entry) => entry.value)
          .whereType<String>()
          .join('\n');

      for (final forbidden in entry.value) {
        expect(
          adderallText,
          isNot(contains(forbidden)),
          reason: '${entry.key} must not regress to "$forbidden"',
        );
      }
    }
  });
}
