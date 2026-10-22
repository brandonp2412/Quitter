import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/nitrous_oxide_page.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'nitrous oxide milestones include unique sorted long-term anniversaries',
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
            home: NitrousOxidePage(started: false),
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
        730: 'Two years, no return',
        1095: 'Three years of distance',
        1460: 'Four years',
        1825: 'Five years',
      };
      const source = 'https://pubmed.ncbi.nlm.nih.gov/35695047/';

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
        expect(
          milestone.reference,
          'Marsden et al. (2022) - Chronic nitrous oxide systematic review',
        );
        expect(milestone.link, source);
        expect(milestone.referenceContent, isNotNull);
        final referenceContent = milestone.referenceContent!.toLowerCase();
        expect(referenceContent, contains('recovery'));
        if (entry.key == 730) {
          expect(referenceContent, contains('partial recovery'));
        }
        expect(referenceContent, isNot(contains('fully recovered')));
      }
      expect(descriptions, hasLength(4));
    },
  );

  test('all supported ARBs localize every nitrous oxide milestone', () {
    const days = [1, 3, 7, 14, 30, 90, 365, 730, 1095, 1460, 1825];
    const knownArtifacts = <String, List<String>>{
      'ar': ['الامتناع المستمر عن ممارسة الجنس'],
      'de': [
        'System Clearing',
        'physischer Rückzug',
        'B12 Rising',
        'Get Tested',
        'Recovery Signal',
        'Bleiben off',
      ],
      'id': ['Informasi referensi pemulihan dalam bahasa Indonesia.'],
      'ko': ['시스템 삭제', '물리적 인출', 'B12 라이징', '에너지 수익', 'NCBI 책장'],
      'pl': [
        'System Clearing',
        'The Real Risk',
        'Poatdrawall',
        'Nerves Healing',
        'Habit i Craving',
        'Rechecky',
      ],
      'pt_BR': ['Sem Retirada Física'],
      'th': ['น้ำมันหมด', 'การสมาคม', 'ทำให้คุณโปรดปราน'],
      'ur': ['گوتم بدھ', 'دو موسم', 'بی12 دوڑ', 'نیوٹرینو', 'سی‌ڈی‌ڈی'],
    };

    final arbFiles =
        Directory('lib/l10n')
            .listSync()
            .whereType<File>()
            .where((file) => RegExp(r'app_[^/]+.arb$').hasMatch(file.path))
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
      final scopedValues = <String>[];

      for (final day in days) {
        for (final suffix in ['Title', 'Description']) {
          final key = 'nitrousOxideMilestone$day$suffix';
          expect(
            arb[key],
            isA<String>().having((value) => value.trim(), key, isNotEmpty),
            reason: '$locale must localize $key',
          );
          final value = arb[key] as String;
          scopedValues.add(value);
          if (suffix == 'Title') {
            expect(
              value.runes.length,
              lessThanOrEqualTo(36),
              reason: '$locale must keep $key compact for phone layouts',
            );
          }
          if (locale != 'en') {
            expect(
              value,
              isNot(equals(english[key])),
              reason: '$locale must not fall back to English for $key',
            );
          }
        }

        final referenceKey = 'nitrousOxideReferenceDay$day';
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
        scopedValues.add(reference);
        expect(
          reference.split('\n\n'),
          hasLength((english[referenceKey] as String).split('\n\n').length),
          reason: '$locale must preserve $referenceKey article structure',
        );
        if (locale != 'en') {
          expect(
            reference,
            isNot(equals(english[referenceKey])),
            reason: '$locale must not fall back to English for $referenceKey',
          );
        }
      }

      final scopedText = scopedValues.join('\n');
      for (final artifact in knownArtifacts[locale] ?? const <String>[]) {
        expect(
          scopedText,
          isNot(contains(artifact)),
          reason: '$locale must not reintroduce $artifact',
        );
      }
    }
  });
}
