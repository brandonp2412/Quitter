import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/benzodiazepine_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'Benzodiazepine milestones include unique sorted long-term anniversaries',
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
            home: BenzodiazepinePage(started: false),
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

      const expectedTitles = {1460: 'Four years of work', 1825: 'Five years'};
      const source =
          'https://www.asam.org/quality-care/clinical-guidelines/benzodiazepine-tapering';

      final descriptions = <String>{};
      for (final entry in expectedTitles.entries) {
        final milestone = page.milestones.singleWhere(
          (milestone) => milestone.day == entry.key,
        );
        expect(milestone.title, entry.value);
        expect(milestone.title.length, lessThanOrEqualTo(36));
        expect(milestone.description, isNotEmpty);
        descriptions.add(milestone.description);
        expect(
          milestone.reference,
          'Joint Clinical Practice Guideline on Benzodiazepine Tapering (ASAM)',
        );
        expect(milestone.link, source);
        expect(milestone.referenceContent, contains('universal'));
        expect(milestone.localizedReferenceContent, isNotEmpty);
      }
      expect(descriptions, hasLength(2));
    },
  );

  test('all supported ARBs localize the complete benzodiazepine timeline', () {
    const days = [7, 14, 60, 90, 180, 365, 540, 730, 1095, 1460, 1825];
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
          final key = 'benzoMilestone$day$suffix';
          expect(
            arb[key],
            isA<String>().having((value) => value.trim(), key, isNotEmpty),
            reason: '$locale must localize $key',
          );
          if (locale != 'en' && suffix == 'Title') {
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

        final referenceKey = 'benzodiazepineReferenceDay$day';
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
        expect(
          (reference as String).split('\n\n').length,
          (english[referenceKey] as String).split('\n\n').length,
          reason:
              '$locale must preserve the evidence structure for $referenceKey',
        );
        if (locale != 'en') {
          expect(
            reference,
            isNot(equals(english[referenceKey])),
            reason: '$locale must not fall back to English for $referenceKey',
          );
        }
      }
    }
  });

  test('benzodiazepine localization regressions stay repaired', () {
    Map<String, dynamic> arb(String locale) =>
        jsonDecode(File('lib/l10n/app_$locale.arb').readAsStringSync())
            as Map<String, dynamic>;

    final arabic = arb('ar');
    expect(
      arabic['benzodiazepineReferenceDay180'],
      isNot(contains('الامتناع عن ممارسة الجنس')),
    );

    final german = arb('de');
    expect(
      german['benzoMilestone1095Description'],
      isNot(contains('Widerruf')),
    );
    expect(
      german['benzodiazepineReferenceDay1095'],
      allOf(
        isNot(contains('Wiederfindungssignal')),
        isNot(contains('Benzo-Recovery')),
      ),
    );

    final indonesian = arb('id');
    for (final day in [180, 365, 540, 730, 1095]) {
      final reference = indonesian['benzodiazepineReferenceDay$day'] as String;
      expect(
        reference,
        isNot(contains('Informasi referensi pemulihan')),
        reason: 'Indonesian day $day must contain the real evidence article',
      );
    }

    final korean = arb('ko');
    expect(
      korean['benzodiazepineReferenceDay730'],
      allOf(isNot(contains('오랜 탈퇴')), isNot(contains('벤조 전 농도'))),
    );
    expect(korean['benzodiazepineReferenceDay1095'], isNot(contains('회수 일정')));

    final polish = arb('pl');
    expect(
      polish['benzodiazepineReferenceDay730'],
      isNot(contains('po drawaniu')),
    );
    expect(
      polish['benzodiazepineReferenceDay1095'],
      isNot(contains('thinking, memory')),
    );

    final russian = arb('ru');
    expect(
      russian['benzoMilestone365Description'],
      isNot(contains('Лечение мозга')),
    );
    expect(
      russian['benzodiazepineReferenceDay1095'],
      isNot(contains('крайний срок')),
    );
    expect(
      russian['benzodiazepineReferenceDay180'],
      isNot(contains('Psychoological')),
    );

    final thai = arb('th');
    expect(
      thai['benzodiazepineReferenceDay180'],
      isNot(contains('กำไรที่วัดได้')),
    );

    final urdu = arb('ur');
    expect(
      urdu['benzodiazepineReferenceDay730'],
      isNot(contains('معافی مانگنے')),
    );
  });
}
