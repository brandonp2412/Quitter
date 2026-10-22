import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'pornography milestones include unique sorted long-term anniversaries',
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
            home: PornographyPage(started: false),
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
        1095: 'Three years of control',
        1460: 'Four years, your terms',
        1825: 'Five years',
      };
      const source = 'https://pubmed.ncbi.nlm.nih.gov/41879870/';
      const newDays = {730, 1095, 1460};

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
        expect(milestone.localizedReferenceContent, isNotEmpty);
        expect(milestone.referenceContent, isNotNull);

        if (newDays.contains(entry.key)) {
          expect(
            milestone.reference,
            'Ince et al. (2026) - expert review of CSBD and PPU',
          );
          final referenceContent = milestone.referenceContent!.toLowerCase();
          expect(referenceContent, contains('ince et al.'));
          expect(referenceContent, contains('does not'));
          expect(referenceContent, isNot(contains('fully recovered')));
        }
      }
      expect(descriptions, hasLength(4));
    },
  );

  test('all supported ARBs localize every pornography milestone', () {
    const days = [1, 3, 7, 14, 30, 90, 180, 365, 730, 1095, 1460, 1825];
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
          final key = 'pornographyMilestone$day$suffix';
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

        final referenceKey = 'pornographyReferenceDay$day';
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
          reference.split('\n\n'),
          hasLength(englishReference.split('\n\n').length),
          reason: '$locale must preserve paragraph structure for $referenceKey',
        );
        if (locale != 'en') {
          expect(
            reference,
            isNot(equals(englishReference)),
            reason: '$locale must not fall back to English for $referenceKey',
          );
        }

        if (locale == 'ur') {
          final paragraphs = reference.split('\n\n');
          final narrative = [paragraphs.first, ...paragraphs.skip(2)].join(' ');
          expect(
            narrative,
            isNot(
              matches(
                RegExp(
                  r'\b(?:reset|milestones?|reviews?|withdrawal|craving|sample|trial|pattern|timeline|review|data|control|distress|functioning|outcomes|rewiring|validated|hypersexuality)\b',
                  caseSensitive: false,
                ),
              ),
            ),
            reason:
                'Urdu narrative must not contain mixed English in $referenceKey',
          );
        }

        if (locale == 'th') {
          final paragraphs = reference.split('\n\n');
          final narrative = [paragraphs.first, ...paragraphs.skip(2)].join(' ');
          expect(
            narrative,
            isNot(
              matches(RegExp(r'\bhypersexual(?:ity)?\b', caseSensitive: false)),
            ),
            reason:
                'Thai narrative must localize clinical terminology in $referenceKey',
          );
        }
      }
    }
  });
}
