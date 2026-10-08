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
        730: 'Two Years: Solid Ground',
        1095: 'Three Years: Momentum Yours',
        1460: 'Four Years: Steady Freedom',
        1825: 'Five Years: Built to Last',
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
    },
  );

  test('all supported ARBs localize kratom long-term milestones', () {
    const days = [730, 1095, 1460, 1825];
    final arbFiles =
        Directory('lib/l10n')
            .listSync()
            .whereType<File>()
            .where((file) => RegExp(r'app_[^/]+.arb$').hasMatch(file.path))
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
}
