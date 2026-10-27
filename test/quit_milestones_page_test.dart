import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/milestone_reference_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('selecting a new quit date persists the chosen date', (
    tester,
  ) async {
    final initialDate = DateTime(2020, 1, 15);
    SharedPreferences.setMockInitialValues({
      'alcohol': initialDate.toIso8601String(),
    });

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
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: QuitMilestonesPage(
            title: 'Alcohol',
            storageKey: 'alcohol',
            milestones: const [],
            headerStarted: 'Started',
            headerNotStarted: 'Not started',
            subtitleStarted: 'Started subtitle',
            subtitleNotStarted: 'Not started subtitle',
            initialStarted: true,
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.calendar_month));
    await tester.pumpAndSettle();

    expect(find.byType(DatePickerDialog), findsOneWidget);

    await tester.tap(find.text('10'));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    final prefs = await SharedPreferences.getInstance();
    final persisted = DateTime.parse(prefs.getString('alcohol')!);
    expect(persisted, DateTime(2020, 1, 10));
    expect(find.byType(DatePickerDialog), findsNothing);
  });
  for (final width in [1000.0, 1440.0]) {
    testWidgets('desktop milestones keep summary beside timeline at $width', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final quitDate = DateTime.now().subtract(const Duration(days: 2));
      SharedPreferences.setMockInitialValues({
        'alcohol': quitDate.toIso8601String(),
      });
      final settings = SettingsProvider();
      await settings.loadPreferences();
      final addictions = AddictionProvider();
      await addictions.loadAddictions();
      int? resetDays;
      final milestones = List.generate(
        12,
        (index) => QuitMilestone(
          day: index * 7 + 1,
          title: 'Milestone $index',
          description: 'Recovery progress for this milestone.',
          reference: 'Source',
          link: 'https://example.com',
          referenceContent: 'Benefits\n\nMilestone benefits.',
        ),
      );
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: settings),
            ChangeNotifierProvider.value(value: addictions),
          ],
          child: MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            home: QuitMilestonesPage(
              title: 'Alcohol',
              storageKey: 'alcohol',
              milestones: milestones,
              headerStarted: 'Your journey',
              headerNotStarted: 'Begin your journey',
              subtitleStarted: 'Every day counts',
              subtitleNotStarted: 'Choose your date',
              infoBoxMessage: 'Recovery varies for each person.',
              initialStarted: true,
              onResetPressed: (days) => resetDays = days,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final summaryPosition = tester.getTopLeft(find.text('Your journey'));
      expect(
        summaryPosition.dx,
        lessThan(tester.getTopLeft(find.text('Milestone 0')).dx),
      );
      expect(
        tester.widget<Scaffold>(find.byType(Scaffold)).floatingActionButton,
        isNull,
      );
      await tester.drag(find.byType(Scrollbar), const Offset(0, -450));
      await tester.pumpAndSettle();
      expect(tester.getTopLeft(find.text('Your journey')), summaryPosition);
      await tester.tap(find.byIcon(Icons.restart_alt));
      await tester.pumpAndSettle();
      expect(resetDays, greaterThanOrEqualTo(2));
      await tester.tap(find.byIcon(Icons.calendar_today));
      await tester.pumpAndSettle();
      expect(find.byType(DatePickerDialog), findsOneWidget);
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      final timelineScroll = tester
          .widget<Scrollbar>(find.byType(Scrollbar))
          .controller!;
      timelineScroll.jumpTo(0);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Milestone 0'));
      await tester.pumpAndSettle();
      expect(find.byType(MilestoneReferencePage), findsOneWidget);
      await tester.pageBack();
      await tester.pumpAndSettle();
      tester.view.physicalSize = const Size(600, 1000);
      await tester.pumpAndSettle();
      expect(find.text('Your journey'), findsOneWidget);
      expect(
        tester.widget<Scaffold>(find.byType(Scaffold)).floatingActionButton,
        isNotNull,
      );
      expect(tester.takeException(), isNull);
    });
  }
}
