import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/maoi_page.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('MAOI milestones include unique sorted long-term anniversaries', (
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
          home: MaoiPage(started: false),
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
      1095: 'Three years, steady',
      1460: 'Four years, still you',
      1825: 'Five years',
    };
    const source = 'https://pubmed.ncbi.nlm.nih.gov/23359339/';

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
        'Gahr et al. (2013) - Tranylcypromine Withdrawal Review (PubMed)',
      );
      expect(milestone.link, source);
      expect(milestone.referenceContent, contains('does not'));
      expect(milestone.localizedReferenceContent, isNotEmpty);
    }
    expect(descriptions, hasLength(4));
  });

  test('all supported ARBs localize every MAOI milestone', () {
    const days = [3, 7, 14, 30, 90, 180, 365, 730, 1095, 1460, 1825];
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
          final key = 'maoiMilestone$day$suffix';
          expect(
            arb[key],
            isA<String>().having((value) => value.trim(), key, isNotEmpty),
            reason: '$locale must localize $key',
          );
          if (suffix == 'Title' && (locale != 'en' || day >= 730)) {
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

        final referenceKey = 'maoiReferenceDay$day';
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

        final reference = arb[referenceKey] as String;
        final englishReference = english[referenceKey] as String;
        expect(
          reference.split(String.fromCharCodes([10, 10])).length - 1,
          englishReference.split(String.fromCharCodes([10, 10])).length - 1,
          reason: '$locale must preserve paragraph structure for $referenceKey',
        );
        expect(
          '•'.allMatches(reference).length,
          '•'.allMatches(englishReference).length,
          reason: '$locale must preserve bullet structure for $referenceKey',
        );
      }
    }
  });

  test('MAOI locales reject known translation artifacts', () {
    final indonesian =
        jsonDecode(File('lib/l10n/app_id.arb').readAsStringSync())
            as Map<String, dynamic>;
    final polish =
        jsonDecode(File('lib/l10n/app_pl.arb').readAsStringSync())
            as Map<String, dynamic>;
    final urdu =
        jsonDecode(File('lib/l10n/app_ur.arb').readAsStringSync())
            as Map<String, dynamic>;
    final korean =
        jsonDecode(File('lib/l10n/app_ko.arb').readAsStringSync())
            as Map<String, dynamic>;
    final thai =
        jsonDecode(File('lib/l10n/app_th.arb').readAsStringSync())
            as Map<String, dynamic>;

    String maoiText(Map<String, dynamic> arb) => arb.entries
        .where((entry) => entry.key.startsWith('maoi'))
        .map((entry) => entry.value)
        .whereType<String>()
        .join(String.fromCharCode(10));

    expect(
      maoiText(indonesian),
      isNot(contains('Informasi referensi pemulihan dalam bahasa Indonesia')),
    );
    expect(maoiText(polish), isNot(contains('Brain-Chemical')));
    expect(
      maoiText(urdu),
      isNot(contains('research on MAOI withdrawal reactions')),
    );
    expect(maoiText(korean), isNot(contains('효소 회수')));
    expect(maoiText(thai), isNot(contains('other ใดๆ')));
  });
}
