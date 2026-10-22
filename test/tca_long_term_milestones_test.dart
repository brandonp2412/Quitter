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
import 'package:quitter/tca_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('TCA milestones include unique sorted long-term anniversaries', (
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
          home: TcaPage(started: false),
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
      1095: 'Three years, still going',
      1460: 'Four years, your pace',
      1825: 'Five years',
    };
    const source =
        'https://www.nice.org.uk/guidance/ng222/chapter/Recommendations';

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
        'NICE - Depression in adults: treatment and management',
      );
      expect(milestone.localizedReferenceContent, isNotEmpty);
      expect(milestone.referenceContent, isNotNull);
      expect(milestone.referenceContent!.toLowerCase(), contains('nice'));
      expect(
        milestone.referenceContent!.toLowerCase(),
        isNot(contains('fully recovered')),
      );
      expect(
        milestone.referenceContent!.toLowerCase(),
        isNot(contains('complete recovery')),
      );
    }
    expect(descriptions, hasLength(4));
  });

  test('all supported ARBs localize the complete TCA milestone timeline', () {
    const days = [3, 7, 14, 30, 90, 180, 365, 730, 1095, 1460, 1825];
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

    List<int> referenceShape(String value) {
      return value
          .split('\n\n')
          .map(
            (section) => section
                .split('\n')
                .where((line) => line.startsWith('•'))
                .length,
          )
          .toList();
    }

    const forbiddenArtifacts = <String, List<String>>{
      'de': ['TZA'],
      'fa': ['از پیشرفت محافظت کن\nاگر علائم افسردگی'],
      'fr': [
        'Protège tes progrès',
        'contacte rapidement ton professionnel de santé',
      ],
      'ko': ['아세틸콜린 반동 피크', '일반적으로 처음 며칠 동안 최고조', '정상으로 돌아옵니다'],
      'pt_BR': [
        'Picos de recuperação da acetilcolina',
        'rebote da acetilcolina geralmente atinge o pico',
        'voltam ao normal',
        'cerca de 65% permaneceu sem recaída',
      ],
      'pt': ['cerca de 65% manteve-se sem recaída'],
      'ru': ['Защити прогресс', 'свяжись со своим врачом'],
    };

    for (final file in arbFiles) {
      final locale = file.uri.pathSegments.last
          .replaceFirst('app_', '')
          .replaceFirst('.arb', '');
      final arb = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      final scopedValues = <String>[];

      for (final day in days) {
        for (final suffix in ['Title', 'Description']) {
          final key = 'tcaMilestone$day$suffix';
          expect(
            arb[key],
            isA<String>().having((value) => value.trim(), key, isNotEmpty),
            reason: '$locale must localize $key',
          );
          scopedValues.add(arb[key] as String);
          if (locale != 'en') {
            expect(
              arb[key],
              isNot(equals(english[key])),
              reason: '$locale must not fall back to English for $key',
            );
            if (suffix == 'Title') {
              expect(
                (arb[key] as String).runes.length,
                lessThanOrEqualTo(36),
                reason: '$locale must keep $key compact for phone layouts',
              );
            }
          }
        }

        final referenceKey = 'tcaReferenceDay$day';
        expect(
          arb[referenceKey],
          isA<String>().having(
            (value) => value.trim(),
            referenceKey,
            isNotEmpty,
          ),
          reason: '$locale must localize $referenceKey',
        );
        scopedValues.add(arb[referenceKey] as String);
        if (locale != 'en') {
          expect(
            arb[referenceKey],
            isNot(equals(english[referenceKey])),
            reason: '$locale must not fall back to English for $referenceKey',
          );
          expect(
            referenceShape(arb[referenceKey] as String),
            equals(referenceShape(english[referenceKey] as String)),
            reason:
                '$locale must preserve paragraph and bullet structure for $referenceKey',
          );
        }
      }

      final joinedScope = scopedValues.join('\n');
      for (final artifact in forbiddenArtifacts[locale] ?? const <String>[]) {
        expect(
          joinedScope,
          isNot(contains(artifact)),
          reason:
              '$locale must not reintroduce TCA translation artifact: $artifact',
        );
      }
    }
  });
}
