import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/meth_page.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('meth milestones include unique sorted long-term anniversaries', (
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
          home: MethPage(started: false),
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
      1095: 'Three years, still clear',
      1460: 'Four years without meth',
      1825: 'Five years',
    };
    const newSource = 'https://pubmed.ncbi.nlm.nih.gov/42748562/';

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

      if (entry.key == 730) {
        expect(
          milestone.link,
          'https://pmc.ncbi.nlm.nih.gov/articles/PMC2911490/',
        );
      } else {
        expect(
          milestone.reference,
          'Cao et al. (2026) - Meth neurocognition meta-analysis',
        );
        expect(milestone.link, newSource);
        expect(milestone.referenceContent, contains('280 days'));
        expect(milestone.referenceContent, contains('very low'));
      }
    }
    expect(descriptions, hasLength(4));
  });

  test('all supported ARBs localize the complete meth timeline', () {
    const days = [1, 3, 7, 30, 90, 180, 365, 420, 730, 1095, 1460, 1825];
    const knownBadFragments = <String, List<String>>{
      'ar': ['ممارسة الجنس', 'الممتنعين عن التدخين'],
      'id': ['Informasi referensi pemulihan dalam bahasa Indonesia'],
      'ko': ['인출', '금연', '금주', '금욕'],
      'pl': ['windykacja', 'metotreksat', 'Withdrawall'],
      'pt': ['parar de fumar'],
      'pt_BR': ['parar de fumar', 'Duas fases de retirada'],
      'th': ['ถอนเงิน', 'เลิกบุหรี่'],
      'ur': ['یہوواہ'],
    };
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

    int paragraphBreaks(String value) =>
        RegExp(r'\n\n').allMatches(value).length;
    int bullets(String value) =>
        RegExp(r'^• ', multiLine: true).allMatches(value).length;

    for (final file in arbFiles) {
      final locale = file.uri.pathSegments.last
          .replaceFirst('app_', '')
          .replaceFirst('.arb', '');
      final arb = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      final scopedValues = <String>[];

      for (final day in days) {
        for (final suffix in ['Title', 'Description']) {
          final key = 'methMilestone$day$suffix';
          expect(
            arb[key],
            isA<String>().having((value) => value.trim(), key, isNotEmpty),
            reason: '$locale must localize $key',
          );
          scopedValues.add(arb[key] as String);
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

        final referenceKey = 'methReferenceDay$day';
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
        scopedValues.add(reference);
        expect(
          paragraphBreaks(reference),
          paragraphBreaks(englishReference),
          reason: '$locale must preserve $referenceKey article sections',
        );
        expect(
          bullets(reference),
          bullets(englishReference),
          reason: '$locale must preserve $referenceKey evidence bullets',
        );
        if (locale != 'en') {
          expect(
            reference,
            isNot(equals(englishReference)),
            reason: '$locale must not fall back to English for $referenceKey',
          );
        }
      }

      final scopedText = scopedValues.join('\n');
      for (final fragment in knownBadFragments[locale] ?? const <String>[]) {
        expect(
          scopedText,
          isNot(contains(fragment)),
          reason: '$locale must not regress to the known bad translation',
        );
      }
    }
  });
}
