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
import 'package:quitter/social_media_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'social media milestones include unique sorted long-term anniversaries',
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
            home: SocialMediaPage(started: false),
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
        730: 'Two years of your time',
        1095: 'Three years',
        1460: 'Four years, feed optional',
        1825: 'Five years',
      };
      const source = 'https://pubmed.ncbi.nlm.nih.gov/39280291/';

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
          'Ramadhan et al. - Digital social media detox meta-analysis',
        );
        expect(milestone.localizedReferenceContent, isNotEmpty);
        expect(milestone.referenceContent, isNotNull);
        expect(
          milestone.referenceContent!.toLowerCase(),
          contains('meta-analysis'),
        );
        expect(
          milestone.referenceContent!.toLowerCase(),
          isNot(contains('brain reset')),
        );
        expect(
          milestone.referenceContent!.toLowerCase(),
          isNot(contains('fully recovered')),
        );
      }
      expect(descriptions, hasLength(4));
    },
  );

  test('all supported ARBs localize the full social media timeline', () {
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
          final key = 'socialMediaMilestone$day$suffix';
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

        final referenceKey = 'socialMediaReferenceDay$day';
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

      final socialMediaValues = <String>[
        for (final day in days) ...[
          arb['socialMediaMilestone${day}Title'] as String,
          arb['socialMediaMilestone${day}Description'] as String,
          arb['socialMediaReferenceDay$day'] as String,
        ],
      ].join('\n');

      switch (locale) {
        case 'de':
          expect(socialMediaValues, isNot(contains('Futterexposition')));
          expect(socialMediaValues, isNot(contains('Vorbettrolle')));
        case 'id':
          expect(
            socialMediaValues,
            isNot(contains('Informasi referensi pemulihan')),
          );
          expect(
            socialMediaValues,
            isNot(contains('sumber kesehatan publik dan penelitian terkait')),
          );
        case 'ko':
          expect(socialMediaValues, isNot(contains('사료 노출')));
          expect(socialMediaValues, isNot(contains('심야의 두루마리')));
          expect(socialMediaValues, isNot(contains('자동 검사')));
        case 'pl':
          expect(socialMediaValues, isNot(contains('trialgis')));
          expect(socialMediaValues, isNot(contains('7800.000')));
          expect(socialMediaValues, isNot(contains('anxiete')));
          expect(socialMediaValues, isNot(contains('really,')));
        case 'th':
          expect(socialMediaValues, isNot(contains('ผู้คน other')));
          expect(socialMediaValues, isNot(contains('Takeaway')));
          expect(socialMediaValues, isNot(contains('อาหารสัตว์')));
        case 'ur':
          expect(socialMediaValues, isNot(contains('<unk>')));
          expect(socialMediaValues, isNot(contains('حسن ابدال')));
          expect(socialMediaValues, isNot(contains('کتابِ‌مُقدس')));
      }
    }
  });
}
