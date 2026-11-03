import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/timeline_tile.dart';

void main() {
  test('milestone descriptions lead with progress, not repeated durations', () {
    final arb =
        jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
            as Map<String, dynamic>;
    final milestoneTitle = RegExp(r'^\w+Milestone\d+Title$');
    final durationOpening = RegExp(
      r'^(?:A full|A whole|A|An|One|Two|Three|Four|Five|Six|Seven|Eight|First|Half a|Half|Eighteen|420) '
      r'(?:day|days|night|week|weeks|fortnight|month|months|year|years)\b',
      caseSensitive: false,
    );
    final titles = arb.keys.where((key) => milestoneTitle.hasMatch(key));
    expect(titles.length, greaterThanOrEqualTo(277));

    for (final titleKey in titles) {
      final descriptionKey =
          '${titleKey.substring(0, titleKey.length - 5)}Description';
      final description = arb[descriptionKey] as String;
      expect(
        durationOpening.hasMatch(description),
        isFalse,
        reason: '$descriptionKey repeats the milestone duration',
      );
    }

    expect(
      arb['ketamineMilestone30Description'],
      startsWith('Your bladder and kidneys'),
    );
    expect(
      arb['ketamineMilestone90Description'],
      startsWith('The mood, bladder and cognitive fallout'),
    );
  });
  testWidgets('ketamine cards show the milestone duration once', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [AppLocalizations.delegate],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              final l10n = AppLocalizations.of(context)!;
              return ListView(
                children: [
                  for (final milestone in [
                    QuitMilestone(
                      day: 30,
                      title: l10n.ketamineMilestone30Title,
                      description: l10n.ketamineMilestone30Description,
                      reference: 'Source',
                      link: 'https://example.com',
                    ),
                    QuitMilestone(
                      day: 90,
                      title: l10n.ketamineMilestone90Title,
                      description: l10n.ketamineMilestone90Description,
                      reference: 'Source',
                      link: 'https://example.com',
                    ),
                  ])
                    TimelineTile(
                      milestone: milestone,
                      isCompleted: false,
                      isNext: false,
                      isLast: milestone.day == 90,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );

    expect(find.text('A month for recovery'), findsOneWidget);
    expect(find.text('Three months clear'), findsOneWidget);
    expect(find.textContaining('A month without ketamine'), findsNothing);
    expect(find.textContaining('Three months without ketamine'), findsNothing);
  });
}
