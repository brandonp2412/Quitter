import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/home_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SettingsProvider settingsProvider;
  late AddictionProvider addictionProvider;

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'show_alcohol': false,
      'show_vaping': false,
      'show_smoking': false,
      'show_marijuana': false,
      'show_nicotine_pouches': false,
      'show_opioids': false,
      'show_social_media': false,
      'show_pornography': false,
    });
    settingsProvider = SettingsProvider();
    addictionProvider = AddictionProvider();
    await settingsProvider.loadPreferences();
    await addictionProvider.loadAddictions();
  });

  Widget createTestWidget() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>.value(value: settingsProvider),
        ChangeNotifierProvider<AddictionProvider>.value(
          value: addictionProvider,
        ),
      ],
      child: const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomePage(),
      ),
    );
  }

  group('HomePage Widget Tests', () {
    testWidgets('should render HomePage without errors', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Add'), findsOneWidget);
    });

    testWidgets(
      'should display grid of addiction cards when settings are enabled',
      (WidgetTester tester) async {
        SharedPreferences.setMockInitialValues({
          'alcohol': '2024-01-01',
          'vaping': '2024-01-01',
          'smoking': '2024-01-01',
        });
        addictionProvider = AddictionProvider();
        await addictionProvider.loadAddictions();
        await tester.pumpWidget(createTestWidget());

        await tester.pumpAndSettle();

        expect(find.text('Alcohol'), findsOneWidget);
        expect(find.text('Vaping'), findsOneWidget);
        expect(find.text('Smoking'), findsOneWidget);
      },
    );

    testWidgets('should not display cards when settings are disabled', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Alcohol'), findsNothing);
      expect(find.text('Vaping'), findsNothing);
      expect(find.text('Smoking'), findsNothing);
    });

    testWidgets(
      'should display all addiction types when all settings are enabled',
      (WidgetTester tester) async {
        SharedPreferences.setMockInitialValues({
          'alcohol': '2024-01-01',
          'vaping': '2024-01-01',
          'smoking': '2024-01-01',
          'marijuana': '2024-01-01',
          'nicotine_pouches': '2024-01-01',
          'opioids': '2024-01-01',
          'social_media': '2024-01-01',
          'pornography': '2024-01-01',
        });
        addictionProvider = AddictionProvider();
        await addictionProvider.loadAddictions();

        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        expect(find.text('Alcohol', skipOffstage: false), findsOneWidget);
        expect(find.text('Vaping', skipOffstage: false), findsOneWidget);
        expect(find.text('Smoking', skipOffstage: false), findsOneWidget);
        expect(find.text('Marijuana', skipOffstage: false), findsOneWidget);
        expect(
          find.text('Nicotine pouches', skipOffstage: false),
          findsOneWidget,
        );
        expect(find.text('Opioids', skipOffstage: false), findsOneWidget);
        expect(find.text('Social Media', skipOffstage: false), findsOneWidget);
        expect(find.text('AC', skipOffstage: false), findsOneWidget);
      },
    );
  });

  group('HomePage Long Press Tests', () {
    testWidgets('should show hide bottom sheet on card long press', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues({'alcohol': '2024-01-01'});
      addictionProvider = AddictionProvider();
      await addictionProvider.loadAddictions();

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.longPress(find.text('Alcohol'));
      await tester.pumpAndSettle();

      expect(find.text('Stop tracking Alcohol?'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Remove'), findsOneWidget);
    });

    testWidgets('should cancel hide action when Cancel is pressed', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues({'alcohol': '2024-01-01'});
      addictionProvider = AddictionProvider();
      await addictionProvider.loadAddictions();

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.longPress(find.text('Alcohol'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(find.text('Stop tracking Alcohol?'), findsNothing);
      expect(find.text('Alcohol'), findsOne);
    });

    testWidgets('should hide card when Hide is confirmed', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues({'alcohol': '2024-01-01'});
      addictionProvider = AddictionProvider();
      await addictionProvider.loadAddictions();

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.longPress(find.text('Alcohol'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Remove'));
      await tester.pumpAndSettle();
      expect(find.text('Alcohol'), findsNothing);
    });
  });

  group('HomePage Navigation Tests', () {
    testWidgets('should navigate to AddAddictionPage when FAB is tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      expect(find.text('Track an Addiction'), findsOne);
    });

    testWidgets('should navigate to addiction page when card is tapped', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues({'alcohol': '2024-01-01'});
      addictionProvider = AddictionProvider();
      await addictionProvider.loadAddictions();

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Alcohol'));
      await tester.pumpAndSettle();

      expect(find.text('Sober & sparkling'), findsOneWidget);
    });
  });

  group('HomePage Overflow Tests', () {
    testWidgets('nicotine pouches card does not overflow on narrow screen', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(360, 640);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      SharedPreferences.setMockInitialValues({
        'show_nicotine_pouches': true,
        'nicotine_pouches': '2026-05-02',
      });
      settingsProvider = SettingsProvider();
      addictionProvider = AddictionProvider();
      await settingsProvider.loadPreferences();
      await addictionProvider.loadAddictions();

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Nicotine pouches', findRichText: true), findsOneWidget);
    });
  });
}
