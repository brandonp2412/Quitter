import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/entry.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/stats_page.dart';
import 'package:quitter/weekly_time_estimates.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget app(Widget child, AddictionProvider provider) =>
    ChangeNotifierProvider.value(
      value: provider,
      child: MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: child),
      ),
    );

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('defaults cover all 28 preset habits and persist overrides', () async {
    expect(defaultWeeklyTimeMinutes.length, 28);
    final provider = AddictionProvider();
    await provider.loadAddictions();
    expect(provider.weeklyTimeMinutesFor('social_media'), 1050);
    expect(provider.weeklyTimeMinutesFor('smoking'), 525);
    expect(provider.weeklyTimeMinutesFor('heroin'), 210);
    expect(provider.weeklyTimeMinutesFor('custom'), isNull);

    await provider.setWeeklyTimeMinutes('social_media', 750);
    await provider.setWeeklyTimeMinutes('heroin', null);
    await provider.setWeeklyTimeMinutes('custom', 135);

    final reloaded = AddictionProvider();
    await reloaded.loadAddictions();
    expect(reloaded.weeklyTimeMinutesFor('social_media'), 750);
    expect(reloaded.weeklyTimeMinutesFor('heroin'), isNull);
    expect(reloaded.hasWeeklyTimeOverride('heroin'), isTrue);
    expect(reloaded.weeklyTimeMinutesFor('custom'), 135);

    await reloaded.resetWeeklyTimeMinutes('heroin');
    expect(reloaded.weeklyTimeMinutesFor('heroin'), 210);
    await expectLater(
      reloaded.setWeeklyTimeMinutes('smoking', -1),
      throwsArgumentError,
    );
    await expectLater(
      reloaded.setWeeklyTimeMinutes('smoking', 10081),
      throwsArgumentError,
    );
  });

  test('deleting custom habit also removes time estimate', () async {
    final provider = AddictionProvider();
    await provider.loadAddictions();
    await provider.addEntry(
      Entry(
        id: 'custom-habit',
        title: 'Custom',
        quitDate: DateTime.now(),
        color: Colors.blue,
      ),
    );
    await provider.setWeeklyTimeMinutes('custom-habit', 180);
    await provider.deleteEntry('custom-habit');
    expect(provider.hasWeeklyTimeOverride('custom-habit'), isFalse);
    final reloaded = AddictionProvider();
    await reloaded.loadAddictions();
    expect(reloaded.weeklyTimeMinutesFor('custom-habit'), isNull);
  });

  testWidgets(
    'time card uses weekly defaults, edits and persists custom time',
    (tester) async {
      SharedPreferences.setMockInitialValues({
        'social_media': DateTime.now()
            .subtract(const Duration(days: 8))
            .toIso8601String(),
        'pornography': DateTime.now()
            .subtract(const Duration(days: 8))
            .toIso8601String(),
      });
      final provider = AddictionProvider();
      await provider.loadAddictions();
      await tester.pumpWidget(app(const StatsPage(), provider));

      expect(find.byKey(const ValueKey('timeSavedCard')), findsOneWidget);
      expect(find.text('17h 30m per week'), findsOneWidget);
      expect(find.text('2h per week'), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('editTimeSaved')));
      await tester.pumpAndSettle();
      expect(find.text('Hours'), findsWidgets);

      await tester.enterText(
        find.byKey(const ValueKey('timeHours:social_media')),
        '12',
      );
      await tester.enterText(
        find.byKey(const ValueKey('timeMinutes:social_media')),
        '15',
      );
      await tester.ensureVisible(
        find.byKey(const ValueKey('timeEnabled:pornography')),
      );
      await tester.tap(find.byKey(const ValueKey('timeEnabled:pornography')));
      await tester.pump();
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      expect(provider.weeklyTimeMinutesFor('social_media'), 735);
      expect(provider.weeklyTimeMinutesFor('pornography'), isNull);
      expect(find.text('12h 15m per week'), findsWidgets);
      expect(find.text('2h per week'), findsNothing);

      final reloaded = AddictionProvider();
      await reloaded.loadAddictions();
      expect(reloaded.weeklyTimeMinutesFor('social_media'), 735);
      expect(reloaded.weeklyTimeMinutesFor('pornography'), isNull);
    },
  );

  testWidgets('custom-only stats offer an editable time estimate', (
    tester,
  ) async {
    final provider = AddictionProvider();
    await provider.loadAddictions();
    await provider.addEntry(
      Entry(
        id: 'custom-time',
        title: 'Gaming',
        quitDate: DateTime.now().subtract(const Duration(days: 14)),
        color: Colors.blue,
      ),
    );
    await tester.pumpWidget(app(const StatsPage(), provider));
    expect(find.byKey(const ValueKey('timeSavedCard')), findsOneWidget);
    expect(
      find.text('Add a weekly estimate to see time reclaimed.'),
      findsOneWidget,
    );
    await tester.tap(find.byKey(const ValueKey('editTimeSaved')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('timeEnabled:custom-time')));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const ValueKey('timeHours:custom-time')),
      '4',
    );
    await tester.enterText(
      find.byKey(const ValueKey('timeMinutes:custom-time')),
      '30',
    );
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(provider.weeklyTimeMinutesFor('custom-time'), 270);
    expect(find.text('4h 30m per week'), findsWidgets);
  });
}
