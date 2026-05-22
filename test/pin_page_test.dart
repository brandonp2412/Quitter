import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/pin_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SettingsProvider settingsProvider;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    settingsProvider = SettingsProvider();
    await settingsProvider.loadPreferences();
  });

  Widget createTestWidget() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>.value(value: settingsProvider),
      ],
      child: const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: SizedBox(height: 1000.0, child: PinPage()),
      ),
    );
  }

  group('PinPage', () {
    testWidgets('should unlock successfully', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));
      settingsProvider.setPinEnabled(true, '123');

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Enter PIN'), findsOneWidget);
      await tester.tap(find.text('1'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('3'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(settingsProvider.isUnlocked, isTrue);
    });

    testWidgets('should reject invalid pin', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));
      settingsProvider.setPinEnabled(true, '123');

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Enter PIN'), findsOneWidget);
      await tester.tap(find.text('1'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.text('Incorrect PIN'), findsOne);
    });

    testWidgets('should activate lockout after 3 failed attempts', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));
      await settingsProvider.setPinEnabled(true, '123');

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      for (int i = 0; i < 3; i++) {
        await tester.tap(find.text('9'));
        await tester.pumpAndSettle();
        await tester.tap(find.byIcon(Icons.check));
        await tester.pumpAndSettle();
      }

      expect(settingsProvider.isPinLockoutActive, isTrue);
      expect(find.textContaining('Try again in'), findsOneWidget);
    });
  });

  group('SettingsProvider PIN lockout', () {
    test('blocks unlock during active lockout', () async {
      await settingsProvider.setPinEnabled(true, '1234');

      await settingsProvider.unlock('0000');
      await settingsProvider.unlock('0000');
      await settingsProvider.unlock('0000');

      expect(settingsProvider.isPinLockoutActive, isTrue);

      final result = await settingsProvider.unlock('1234');
      expect(result, isFalse);
      expect(settingsProvider.isUnlocked, isFalse);
    });

    test('persists lockout state across provider reload', () async {
      await settingsProvider.setPinEnabled(true, '1234');

      await settingsProvider.unlock('0000');
      await settingsProvider.unlock('0000');
      await settingsProvider.unlock('0000');

      expect(settingsProvider.isPinLockoutActive, isTrue);

      final settingsProvider2 = SettingsProvider();
      await settingsProvider2.loadPreferences();

      expect(settingsProvider2.isPinLockoutActive, isTrue);
    });

    test('clears lockout on successful unlock', () async {
      await settingsProvider.setPinEnabled(true, '1234');

      await settingsProvider.unlock('0000');
      await settingsProvider.unlock('0000');

      expect(settingsProvider.isPinLockoutActive, isFalse);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(
        'pin_locked_until_ms',
        DateTime.now()
            .subtract(const Duration(seconds: 1))
            .millisecondsSinceEpoch,
      );
      await prefs.setInt('pin_failed_attempts', 3);

      final settingsProvider2 = SettingsProvider();
      await settingsProvider2.loadPreferences();

      await settingsProvider2.clearExpiredPinLockout();
      expect(settingsProvider2.isPinLockoutActive, isFalse);

      final result = await settingsProvider2.unlock('1234');
      expect(result, isTrue);
    });
  });
}
