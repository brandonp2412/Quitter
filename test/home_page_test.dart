import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/home_page.dart';
import 'package:quitter/settings_provider.dart';

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
      child: const MaterialApp(home: HomePage()),
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
          'show_alcohol': true,
          'show_vaping': true,
          'show_smoking': true,
        });
        final testSettings = SettingsProvider();
        await testSettings.loadPreferences();

        await tester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<SettingsProvider>.value(
                value: testSettings,
              ),
              ChangeNotifierProvider<AddictionProvider>.value(
                value: addictionProvider,
              ),
            ],
            child: const MaterialApp(home: HomePage()),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Alcohol'), findsOneWidget);
        expect(find.text('Vaping'), findsOneWidget);
        expect(find.text('Smoking'), findsOneWidget);
        expect(find.text('Tap to start'), findsWidgets);
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
          'show_alcohol': true,
          'show_vaping': true,
          'show_smoking': true,
          'show_marijuana': true,
          'show_nicotine_pouches': true,
          'show_opioids': true,
          'show_social_media': true,
          'show_pornography': true,
        });
        final testSettings = SettingsProvider();
        await testSettings.loadPreferences();

        await tester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<SettingsProvider>.value(
                value: testSettings,
              ),
              ChangeNotifierProvider<AddictionProvider>.value(
                value: addictionProvider,
              ),
            ],
            child: const MaterialApp(home: HomePage()),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Alcohol'), findsOneWidget);
        expect(find.text('Vaping'), findsOneWidget);
        expect(find.text('Smoking'), findsOneWidget);
        expect(find.text('Marijuana'), findsOneWidget);
        expect(find.text('Nicotine Pouches'), findsOneWidget);
        expect(find.text('Opioids'), findsOneWidget);
        expect(find.text('Social Media'), findsOneWidget);
        expect(find.text('AC'), findsOneWidget);
      },
    );
  });

  group('HomePage Long Press Tests', () {
    testWidgets('should show hide bottom sheet on card long press', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues({'show_alcohol': true});
      final testSettings = SettingsProvider();
      await testSettings.loadPreferences();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<SettingsProvider>.value(value: testSettings),
            ChangeNotifierProvider<AddictionProvider>.value(
              value: addictionProvider,
            ),
          ],
          child: const MaterialApp(home: HomePage()),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('Alcohol'));
      await tester.pumpAndSettle();

      expect(find.text('Hide Alcohol?'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Hide'), findsOneWidget);
    });

    testWidgets('should cancel hide action when Cancel is pressed', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues({'show_alcohol': true});
      final testSettings = SettingsProvider();
      await testSettings.loadPreferences();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<SettingsProvider>.value(value: testSettings),
            ChangeNotifierProvider<AddictionProvider>.value(
              value: addictionProvider,
            ),
          ],
          child: const MaterialApp(home: HomePage()),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('Alcohol'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(find.text('Hide Alcohol?'), findsNothing);
      expect(find.text('Alcohol'), findsOne);
    });

    testWidgets('should hide card when Hide is confirmed', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues({'show_alcohol': true});
      final testSettings = SettingsProvider();
      await testSettings.loadPreferences();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<SettingsProvider>.value(value: testSettings),
            ChangeNotifierProvider<AddictionProvider>.value(
              value: addictionProvider,
            ),
          ],
          child: const MaterialApp(home: HomePage()),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('Alcohol'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hide'));
      await tester.pumpAndSettle();
      expect(find.text('Alcohol'), findsNothing);
    });
  });

  group('HomePage Navigation Tests', () {
    testWidgets('should navigate to EditEntryPage when FAB is tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      expect(find.text('Add entry'), findsOne);
    });

    testWidgets('should navigate to addiction page when card is tapped', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues({'show_alcohol': true});
      final testSettings = SettingsProvider();
      await testSettings.loadPreferences();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<SettingsProvider>.value(value: testSettings),
            ChangeNotifierProvider<AddictionProvider>.value(
              value: addictionProvider,
            ),
          ],
          child: const MaterialApp(home: HomePage()),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Alcohol'));
      await tester.pumpAndSettle();

      expect(find.text('Day 1'), findsOneWidget);
    });
  });

  group('HomePage SafeArea Tests', () {
    testWidgets('should wrap content in SafeArea', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(SafeArea), findsOneWidget);
    });
  });
}
