import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('marijuana milestones include unique sorted long-term anniversaries', (
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
          home: MarijuanaPage(started: false),
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

    const expectedLinks = {
      1: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC5414724/',
      3: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC4015312/',
      7: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC5414724/',
      14: 'https://pubmed.ncbi.nlm.nih.gov/12943018/',
      30: 'https://pubmed.ncbi.nlm.nih.gov/11576028/',
      60: 'https://pubmed.ncbi.nlm.nih.gov/25661990/',
      90: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC9110555/',
      180: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC3037578/',
      365: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC5068875/',
      730:
          'https://www.samhsa.gov/resource/ebp/advisory-addressing-cannabis-use-disorder-primary-care-settings-lifespan-approach',
      1095:
          'https://www.samhsa.gov/resource/ebp/advisory-addressing-cannabis-use-disorder-primary-care-settings-lifespan-approach',
      1460:
          'https://www.samhsa.gov/resource/ebp/advisory-addressing-cannabis-use-disorder-primary-care-settings-lifespan-approach',
      1825:
          'https://www.samhsa.gov/resource/ebp/advisory-addressing-cannabis-use-disorder-primary-care-settings-lifespan-approach',
    };
    for (final entry in expectedLinks.entries) {
      final milestone = page.milestones.singleWhere(
        (milestone) => milestone.day == entry.key,
      );
      expect(milestone.link, entry.value);
      expect(milestone.localizedReferenceContent, isNotEmpty);
    }

    const expectedTitles = {
      730: 'Two Years. Solid Work.',
      1095: 'Three Years, Still Clear',
      1460: 'Four Years. Fair Play.',
      1825: 'Five Years Without Cannabis',
    };
    const source =
        'https://www.samhsa.gov/resource/ebp/advisory-addressing-cannabis-use-disorder-primary-care-settings-lifespan-approach';

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
        'SAMHSA (2026) - Cannabis Use Disorder Advisory',
      );
      expect(milestone.link, source);
      expect(milestone.referenceContent, contains('does not'));
      expect(milestone.localizedReferenceContent, isNotEmpty);
    }
    expect(descriptions, hasLength(4));
  });

  test('all supported ARBs localize every marijuana milestone', () {
    const days = [1, 3, 7, 14, 30, 60, 90, 180, 365, 730, 1095, 1460, 1825];
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
          final key = 'marijuanaMilestone$day$suffix';
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

        final referenceKey = 'marijuanaReferenceDay$day';
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
        }

        final englishReference = english[referenceKey] as String;
        final localizedReference = reference as String;
        expect(
          localizedReference.split('\n\n').length,
          englishReference.split('\n\n').length,
          reason: '$locale must preserve paragraph structure for $referenceKey',
        );
        expect(
          localizedReference
              .split('\n')
              .where((line) => line.startsWith('•'))
              .length,
          englishReference
              .split('\n')
              .where((line) => line.startsWith('•'))
              .length,
          reason: '$locale must preserve bullet structure for $referenceKey',
        );
      }
    }
  });

  test('marijuana translations reject known machine artifacts', () {
    const forbiddenByLocale = <String, List<String>>{
      'ar': [
        'الامتناع عن ممارسة الجنس',
        'الامتناع عن التدخين',
        'الوجبات الجاهزة',
      ],
      'de': [
        'Warum Abhebungen passieren',
        'Was Peaks Early',
        'Was ist noch Settling',
        'Auszahlungs-Timeline',
        'Memory-Funktion',
      ],
      'id': ['Informasi referensi pemulihan dalam bahasa Indonesia'],
      'ko': ['대마초 철수', '인출 일정'],
      'pl': [
        'Marihuana Withdrawal',
        'Sharpens koncentracji',
        'Planowanie i podejmowanie decyzji - Recover',
      ],
      'pt': [
        'a partir daqui é tudo difícil',
        'Papa et al.',
        'Retornos de estabilidade de humor',
      ],
      'pt_BR': [
        'a partir daqui é tudo difícil',
        'Papa et al.',
        'Como realmente era o cronograma de retirada',
      ],
      'ru': ['Концентрация обостряет', 'отсюда все в гору'],
      'th': ['ถอนเงิน', 'เลิกบุหรี่', 'สมเด็จพระสันตะปาปา'],
      'ur': [
        'district district',
        'جنگ عظیم دوم',
        'ذیابیطس کی علامات',
        'پُراسرار ہتھیار',
        'Planning and Decing',
      ],
    };

    for (final entry in forbiddenByLocale.entries) {
      final arb =
          jsonDecode(File('lib/l10n/app_${entry.key}.arb').readAsStringSync())
              as Map<String, dynamic>;
      final marijuanaText = arb.entries
          .where(
            (entry) =>
                entry.key.startsWith('marijuanaMilestone') ||
                entry.key.startsWith('marijuanaReferenceDay'),
          )
          .map((entry) => entry.value)
          .whereType<String>()
          .join('\n');

      for (final fragment in entry.value) {
        expect(
          marijuanaText,
          isNot(contains(fragment)),
          reason: '${entry.key} must not contain machine artifact "$fragment"',
        );
      }
    }
  });
}
