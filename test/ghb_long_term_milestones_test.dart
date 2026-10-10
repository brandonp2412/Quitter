import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/ghb_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('GHB milestones include unique sorted long-term anniversaries', (
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
          home: GhbPage(started: false),
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
      730: 'Two Years: Durable Progress',
      1095: 'Three Years: Stronger Ground',
      1460: 'Four Years: Lasting Change',
      1825: 'Five Years: Half a Decade',
    };
    const source = 'https://www.samhsa.gov/substance-use/recovery';

    final descriptions = <String>{};
    for (final entry in expectedTitles.entries) {
      final milestone = page.milestones.singleWhere(
        (milestone) => milestone.day == entry.key,
      );
      expect(milestone.title, entry.value);
      expect(milestone.title.length, lessThanOrEqualTo(36));
      expect(milestone.description, isNotEmpty);
      descriptions.add(milestone.description);
      expect(milestone.reference, 'Recovery and Recovery Support (SAMHSA)');
      expect(milestone.link, source);
      expect(milestone.referenceContent, contains('SAMHSA'));
      expect(milestone.localizedReferenceContent, isNotEmpty);
    }
    expect(descriptions, hasLength(4));
  });

  test('all supported ARBs localize GHB long-term milestones', () {
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
          final key = 'ghbMilestone$day$suffix';
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

        final referenceKey = 'ghbReferenceDay$day';
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

  test('all GHB milestone copy is localized and structurally faithful', () {
    const days = [1, 3, 7, 14, 30, 90, 180, 730, 1095, 1460, 1825];
    const forbiddenByLocale = <String, List<String>>{
      'ar': ['الامتناع عن ممارسة الجنس', 'مجاناً'],
      'de': [
        'Akute Phase Passing',
        'Auszahlungsfrist',
        'Verjüngung',
        'Heißhunger',
      ],
      'id': ['Informasi referensi pemulihan'],
      'ko': ['할인', '휴가'],
      'pl': ['GHBZREX', 'dysCharge', 'Off GHB', 'anxiety', 'za darmo'],
      'pt_BR': ['desconto no GHB', 'Meio ano grátis'],
      'th': ['การถอนเงิน', 'ความอยากอาหาร', ' other'],
      'ur': ['<unk>', 'Audiory', 'Visual Haluciations', 'حمل گِر', 'سگریٹ'],
    };

    final arbFiles =
        Directory('lib/l10n')
            .listSync()
            .whereType<File>()
            .where((file) => RegExp(r'app_[^/]+\.arb$').hasMatch(file.path))
            .toList()
          ..sort((a, b) => a.path.compareTo(b.path));
    final english =
        jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
            as Map<String, dynamic>;

    int paragraphCount(String value) => value.split('\n\n').length;
    int bulletCount(String value) =>
        RegExp(r'(^|\n)• ', multiLine: true).allMatches(value).length;

    for (final file in arbFiles) {
      final locale = file.uri.pathSegments.last
          .replaceFirst('app_', '')
          .replaceFirst('.arb', '');
      final arb = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      final auditedValues = <String>[];

      for (final day in days) {
        for (final suffix in ['Title', 'Description']) {
          final key = 'ghbMilestone$day$suffix';
          final value = arb[key];
          expect(
            value,
            isA<String>().having((text) => text.trim(), key, isNotEmpty),
            reason: '$locale must localize $key',
          );
          auditedValues.add(value as String);

          if (suffix == 'Title') {
            expect(
              value.runes.length,
              lessThanOrEqualTo(day >= 730 ? 36 : 44),
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

        final referenceKey = 'ghbReferenceDay$day';
        final reference = arb[referenceKey];
        expect(
          reference,
          isA<String>().having((text) => text.trim(), referenceKey, isNotEmpty),
          reason: '$locale must localize $referenceKey',
        );
        auditedValues.add(reference as String);

        if (locale != 'en') {
          expect(
            reference,
            isNot(equals(english[referenceKey])),
            reason: '$locale must not fall back to English for $referenceKey',
          );
        }
        expect(
          paragraphCount(reference),
          paragraphCount(english[referenceKey] as String),
          reason: '$locale must preserve paragraph structure for $referenceKey',
        );
        expect(
          bulletCount(reference),
          bulletCount(english[referenceKey] as String),
          reason: '$locale must preserve bullet structure for $referenceKey',
        );
      }

      final joined = auditedValues.join('\n');
      for (final artifact in forbiddenByLocale[locale] ?? const <String>[]) {
        expect(
          joined,
          isNot(contains(artifact)),
          reason:
              '$locale GHB copy must not contain known translation artifact: $artifact',
        );
      }
    }
  });
}
