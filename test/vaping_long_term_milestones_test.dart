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
import 'package:quitter/vaping_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'vaping milestones include unique sorted long-term anniversaries',
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
            home: VapingPage(started: false),
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
        730: 'Two Years: Vape-Free Strength',
        1095: 'Three Years: Momentum Built',
        1460: 'Four Years: Stronger Ground',
        1825: 'Five Years: Half a Decade',
      };
      const source = 'https://www.cdc.gov/tobacco/e-cigarettes/quitting.html';
      const reference = 'CDC — Vaping and Quitting';

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
        expect(milestone.reference, reference);
        expect(milestone.localizedReferenceContent, isNotEmpty);
        expect(
          milestone.localizedReferenceContent!.toLowerCase(),
          contains('cdc'),
        );
        expect(
          milestone.localizedReferenceContent!.toLowerCase(),
          isNot(contains('fully recovered')),
        );
        expect(
          milestone.localizedReferenceContent!.toLowerCase(),
          isNot(contains('complete recovery')),
        );
      }
      expect(descriptions, hasLength(4));
    },
  );

  test('all supported ARBs localize vaping long-term milestones', () {
    const days = [730, 1095, 1460, 1825];
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
          final key = 'vapingMilestone$day$suffix';
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
      }

      const referenceKey = 'vapingLongTermReference';
      expect(
        arb[referenceKey],
        isA<String>().having((value) => value.trim(), referenceKey, isNotEmpty),
        reason: '$locale must localize $referenceKey',
      );
      if (locale != 'en') {
        expect(
          arb[referenceKey],
          isNot(equals(english[referenceKey])),
          reason: '$locale must not fall back to English for $referenceKey',
        );
      }

      if (locale == 'ja') {
        final longTermKeys = <String>[
          for (final day in days) ...[
            'vapingMilestone${day}Title',
            'vapingMilestone${day}Description',
          ],
          referenceKey,
        ];
        for (final key in longTermKeys) {
          expect(
            RegExp(r'[ऀ-ॿ]').hasMatch(arb[key] as String),
            isFalse,
            reason: '$key must not contain Devanagari translation artifacts',
          );
        }
      }
    }
  });
}
