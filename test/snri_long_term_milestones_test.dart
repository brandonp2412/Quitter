import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/snri_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('SNRI milestones include unique sorted long-term anniversaries', (
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
          home: SnriPage(started: false),
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
      730: 'Two Years: Steady Ground',
      1095: 'Three Years: Progress Held',
      1460: 'Four Years: Strength in Time',
      1825: 'Five Years: Five-Year Victory',
    };
    const source =
        'https://www.rcpsych.ac.uk/mental-health/treatments-and-wellbeing/stopping-antidepressants';

    final descriptions = <String>{};
    for (final entry in expectedTitles.entries) {
      final milestone = page.milestones.singleWhere(
        (milestone) => milestone.day == entry.key,
      );
      expect(milestone.title, entry.value);
      expect(milestone.title.runes.length, lessThanOrEqualTo(36));
      expect(milestone.description, isNotEmpty);
      descriptions.add(milestone.description);
      expect(milestone.link, source);
      expect(
        milestone.reference,
        'Royal College of Psychiatrists - Stopping antidepressants',
      );
      expect(milestone.localizedReferenceContent, isNotEmpty);
      expect(milestone.referenceContent, isNotNull);
      expect(
        milestone.referenceContent!.toLowerCase(),
        contains('royal college'),
      );
      expect(
        milestone.referenceContent!.toLowerCase(),
        isNot(contains('fully recovered')),
      );
      expect(
        milestone.referenceContent!.toLowerCase(),
        isNot(contains('complete recovery')),
      );
    }
    expect(descriptions, hasLength(4));
  });

  test('all supported ARBs localize the full SNRI timeline', () {
    const days = [3, 7, 14, 30, 90, 180, 365, 730, 1095, 1460, 1825];
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

    int bulletCount(String value) => value
        .split('\n')
        .where((line) => line.trimLeft().startsWith('•'))
        .length;
    int paragraphCount(String value) => value.split('\n\n').length;

    for (final file in arbFiles) {
      final locale = file.uri.pathSegments.last
          .replaceFirst('app_', '')
          .replaceFirst('.arb', '');
      final arb = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;

      for (final day in days) {
        for (final suffix in ['Title', 'Description']) {
          final key = 'snriMilestone$day$suffix';
          expect(
            arb[key],
            isA<String>().having((value) => value.trim(), key, isNotEmpty),
            reason: '$locale must localize $key',
          );
          if (locale != 'en') {
            expect(
              arb[key],
              isNot(equals(english[key])),
              reason: '$locale must not fall back to English for $key',
            );
            if (suffix == 'Title') {
              expect(
                (arb[key] as String).runes.length,
                lessThanOrEqualTo(36),
                reason: '$locale must keep $key compact for phone layouts',
              );
            }
          }
        }

        final referenceKey = 'snriReferenceDay$day';
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
          expect(
            paragraphCount(reference as String),
            paragraphCount(english[referenceKey] as String),
            reason: '$locale must preserve $referenceKey paragraph structure',
          );
          expect(
            bulletCount(reference),
            bulletCount(english[referenceKey] as String),
            reason: '$locale must preserve $referenceKey evidence bullets',
          );
        }
      }

      final snriValues = <String>[
        for (final day in days) ...[
          arb['snriMilestone${day}Title'] as String,
          arb['snriMilestone${day}Description'] as String,
          arb['snriReferenceDay$day'] as String,
        ],
      ].join('\n');

      switch (locale) {
        case 'ar':
          expect(
            arb['snriMilestone3Description'],
            contains('SNRIs'),
            reason: 'Arabic day 3 must identify the SNRI class correctly',
          );
          expect(arb['snriReferenceDay3'], contains('SNRIs منها مع SSRIs'));
        case 'de':
          expect(snriValues, isNot(contains('Racing Heart')));
          expect(snriValues, isNot(contains('Recovery Achieved')));
          expect(snriValues, isNot(contains('Blunting Resolution')));
        case 'id':
          expect(snriValues, isNot(contains('Informasi referensi pemulihan')));
          expect(snriValues, isNot(contains('gangguan otak')));
        case 'ko':
          expect(snriValues, isNot(contains('뇌졸중')));
          expect(snriValues, isNot(contains('뇌진탕')));
          expect(snriValues, isNot(contains('SNRI 발생')));
        case 'pl':
          expect(snriValues, isNot(contains('fluorescencji')));
          expect(snriValues, isNot(contains('Brain – Chemical')));
          expect(snriValues, isNot(contains('Emocjonalna rezolucja')));
        case 'th':
          expect(snriValues, isNot(contains('การปะทะของสมอง')));
          expect(snriValues, isNot(contains('สถาปัตยกรรมสลีป')));
          expect(snriValues, isNot(contains('เรียวร่างกาย')));
        case 'ur':
          expect(snriValues, isNot(contains('دُنیا کا نظارہ')));
          expect(snriValues, isNot(contains('Dublu Stabilising')));
          expect(snriValues, isNot(contains('کُل‌وقتی خدمت')));
      }
    }
  });
}
