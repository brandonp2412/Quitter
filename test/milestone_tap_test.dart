import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/milestone_reference_page.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('tapping milestone content opens its benefits', (tester) async {
    final quitDate = DateTime.now().subtract(const Duration(days: 2));
    SharedPreferences.setMockInitialValues({
      'milestone_tap_test': quitDate.toIso8601String(),
    });

    final settings = SettingsProvider();
    await settings.loadPreferences();
    final addictions = AddictionProvider();
    await addictions.loadAddictions();

    const milestone = QuitMilestone(
      day: 1,
      title: 'One day milestone',
      description: 'Milestone description',
      reference: 'Milestone source',
      link: 'https://example.com',
      referenceContent: 'Benefits title\n\nBenefits body',
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsProvider>.value(value: settings),
          ChangeNotifierProvider<AddictionProvider>.value(value: addictions),
        ],
        child: const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: QuitMilestonesPage(
            title: 'Test',
            storageKey: 'milestone_tap_test',
            milestones: [milestone],
            headerStarted: 'Started',
            headerNotStarted: 'Not started',
            subtitleStarted: 'Started subtitle',
            subtitleNotStarted: 'Not started subtitle',
            initialStarted: true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('One day milestone'));
    await tester.pumpAndSettle();

    expect(find.byType(MilestoneReferencePage), findsOneWidget);
    expect(find.text('Benefits body'), findsOneWidget);
  });
}
