import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/desktop_shell.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/main.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('desktop navigation switches pages and opens settings', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    SharedPreferences.setMockInitialValues({
      'alcohol': '2026-01-01',
      'smoking': '2026-02-01',
      'vaping': '2026-03-01',
    });
    final settings = SettingsProvider();
    final addictions = AddictionProvider();
    await addictions.loadAddictions();
    final controller = TabController(length: 3, vsync: const TestVSync());
    addTearDown(controller.dispose);
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
          home: DesktopShell(controller: controller, showJournal: true),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationRail),
        matching: find.text('Stats'),
      ),
    );
    await tester.pumpAndSettle();
    expect(controller.index, 1);
    expect(tester.takeException(), isNull);
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationRail),
        matching: find.text('Journal'),
      ),
    );
    await tester.pumpAndSettle();
    expect(controller.index, 2);
    expect(tester.takeException(), isNull);
    tester.view.physicalSize = const Size(1000, 900);
    await tester.pumpAndSettle();
    controller.animateTo(1);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await tester.tap(find.widgetWithText(TextButton, 'Settings'));
    await tester.pumpAndSettle();
    expect(find.byType(AppBar), findsNothing);
    expect(find.byType(Card), findsWidgets);
    expect(find.text('Search settings...'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('window resizing changes navigation without losing selection', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider()),
          ChangeNotifierProvider(create: (_) => AddictionProvider()),
        ],
        child: const QuitterApp(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(NavigationRail), findsOneWidget);
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationRail),
        matching: find.text('Stats'),
      ),
    );
    await tester.pumpAndSettle();
    tester.view.physicalSize = const Size(600, 900);
    await tester.pumpAndSettle();
    expect(find.byType(NavigationRail), findsNothing);
    expect(tester.widget<TabBar>(find.byType(TabBar)).controller!.index, 1);
    expect(tester.takeException(), isNull);
  });
}
