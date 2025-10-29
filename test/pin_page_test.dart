import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
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
  });
}
