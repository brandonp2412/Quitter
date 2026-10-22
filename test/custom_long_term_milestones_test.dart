import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/entry.dart';
import 'package:quitter/entry_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Custom milestones include unique sorted long-term anniversaries', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});

    final settings = SettingsProvider();
    await settings.loadPreferences();
    final addictions = AddictionProvider();
    await addictions.loadAddictions();
    final entry = Entry(
      id: 'custom-long-term-test',
      title: 'Custom',
      quitDate: DateTime(2020),
      color: Colors.blue,
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsProvider>.value(value: settings),
          ChangeNotifierProvider<AddictionProvider>.value(value: addictions),
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: EntryPage(entry: entry),
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
      730: 'Two Years. Solid Work.',
      1095: 'Three Years, Still Going',
      1460: 'Four Years. Fair Play.',
      1825: 'Five Years. Huge.',
    };
    const source =
        'https://nida.nih.gov/publications/drugs-brains-behavior-science-addiction';

    final descriptions = <String>{};
    for (final milestoneEntry in expectedTitles.entries) {
      final milestone = page.milestones.singleWhere(
        (candidate) => candidate.day == milestoneEntry.key,
      );
      expect(milestone.title, milestoneEntry.value);
      expect(milestone.title.runes.length, lessThanOrEqualTo(36));
      expect(milestone.description, isNotEmpty);
      descriptions.add(milestone.description);

      if (milestoneEntry.key > 730) {
        expect(milestone.reference, 'NIDA - Drugs, Brains, and Behavior');
        expect(milestone.link, source);
        expect(milestone.referenceContent, contains('NIDA'));
        expect(milestone.localizedReferenceContent, isNotEmpty);
      }
    }
    expect(descriptions, hasLength(4));
  });

  test('all supported ARBs localize custom long-term milestones', () {
    const days = [1, 3, 7, 14, 30, 90, 180, 365, 730, 1095, 1460, 1825];
    const referenceDays = {1095, 1460, 1825};
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
          final key = 'customMilestone$day$suffix';
          expect(
            arb[key],
            isA<String>().having((value) => value.trim(), key, isNotEmpty),
            reason: '$locale must localize $key',
          );
          if (suffix == 'Title') {
            expect(
              (arb[key] as String).runes.length,
              lessThanOrEqualTo(day >= 730 ? 36 : 44),
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

        if (!referenceDays.contains(day)) continue;
        final referenceKey = 'customReferenceDay$day';
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
      }
    }
  });

  test('custom locale copy avoids known machine-translation regressions', () {
    const forbiddenByLocale = {
      'ar': ['عقلك ينظف', 'يعاني العديد', 'الاعتدال على المدى الطويل'],
      'de': [
        'Recovery Achievement',
        'Entzugserscheinungen Peak',
        'Sie stehen vor dem Sturm',
        'Ihr Körper',
      ],
      'id': ['nafsu makan', 'Gejala Penarikan', 'belakangmu'],
      'ko': ['금주', '절주', '복구 마일스톤'],
      'pl': ['Milestone', 'trwałej naprawy', 'spłacaj'],
      'pt': ['Seu corpo', 'Sua mente', 'Realização de recuperação'],
      'pt_BR': [
        '!Os sintomas',
        '!Após',
        'Recuperação Antecipada',
        'Realização de recuperação',
      ],
      'th': ['ความอยากอาหาร', 'กำเริบของโรค', '!หลัง'],
      'ur': ['جِلد کا رنگ', 'اِس کا نتیجہ', 'اَے میرے بیٹے', 'سوبریٹی'],
    };

    for (final entry in forbiddenByLocale.entries) {
      final arb =
          jsonDecode(File('lib/l10n/app_${entry.key}.arb').readAsStringSync())
              as Map<String, dynamic>;
      final customCopy = arb.entries
          .where((item) => item.key.startsWith('customMilestone'))
          .map((item) => item.value)
          .whereType<String>()
          .join('\n');

      for (final forbidden in entry.value) {
        expect(
          customCopy,
          isNot(contains(forbidden)),
          reason:
              '${entry.key} must not contain known machine artifact: $forbidden',
        );
      }
    }
  });
}
