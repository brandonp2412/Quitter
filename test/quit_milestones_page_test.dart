import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
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
}
