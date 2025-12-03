import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SettingsProvider settingsProvider;
  late AddictionProvider addictionProvider;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    settingsProvider = SettingsProvider();
    addictionProvider = AddictionProvider();
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
        home: SettingsPage(),
      ),
    );
  }

  group('SettingsPage', () {
    testWidgets('displays appearance section header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('Appearance'), findsOneWidget);
    });

    testWidgets('displays main screen items section header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      await tester.dragUntilVisible(
        find.text('Main Screen Items'),
        find.byType(ListView),
        const Offset(0, -300),
      );
      expect(find.text('Main Screen Items'), findsOneWidget);
    });

    testWidgets('displays search bar', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('Search...'), findsOneWidget);
    });

    testWidgets('displays theme setting', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('Theme'), findsOneWidget);
    });

    testWidgets('displays color scheme setting', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('Color scheme'), findsOneWidget);
    });

    testWidgets('displays reset buttons toggle', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('Reset buttons'), findsOneWidget);
      expect(find.text('Show reset buttons on quit pages'), findsOneWidget);
    });

    testWidgets('displays show journal toggle', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('Show journal'), findsOneWidget);
      expect(
        find.text('Enable the journal tab for logging your thoughts'),
        findsOneWidget,
      );
    });

    testWidgets('displays main screen addiction toggles', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final items = [
        'Alcohol',
        'Vaping',
        'Smoking',
        'Marijuana',
        'Nicotine pouches',
        'Opioids',
      ];

      for (final item in items) {
        await tester.dragUntilVisible(
          find.text(item),
          find.byType(ListView),
          const Offset(0, -50),
        );
        expect(find.text(item), findsOneWidget);
      }
    });

    testWidgets('displays system menu items', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      await tester.dragUntilVisible(
        find.text('About'),
        find.byType(ListView),
        const Offset(0, -300),
      );

      expect(find.text('About'), findsOneWidget);

      await tester.dragUntilVisible(
        find.text("What's new"),
        find.byType(ListView),
        const Offset(0, -300),
      );
      expect(find.text("What's new"), findsOneWidget);
      await tester.dragUntilVisible(
        find.text('Enjoying the app?'),
        find.byType(ListView),
        const Offset(0, -300),
      );
      expect(find.text('Enjoying the app?'), findsOneWidget);
      expect(find.text('Report a bug'), findsOneWidget);
      expect(find.text('Export data'), findsOneWidget);

      await tester.dragUntilVisible(
        find.text('Import data'),
        find.byType(ListView),
        const Offset(0, -300),
      );
      expect(find.text('Import data'), findsOneWidget);
    });

    testWidgets('tapping theme opens dialog', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      await tester.tap(find.text('Theme'));
      await tester.pumpAndSettle();

      expect(find.text('Theme mode'), findsOneWidget);
      expect(find.text('Light'), findsOneWidget);
      expect(find.text('Dark'), findsOneWidget);
      expect(find.text('Pure black'), findsOneWidget);
    });

    testWidgets('tapping color scheme opens dialog', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      await tester.tap(find.text('Color scheme'));
      await tester.pumpAndSettle();

      expect(find.text('Color scheme'), findsNWidgets(2));
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('toggling reset buttons switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.showReset;

      final resetSwitch = find.ancestor(
        of: find.text('Reset buttons'),
        matching: find.byType(SwitchListTile),
      );

      await tester.tap(resetSwitch);
      await tester.pump();

      expect(settingsProvider.showReset, !initialValue);
    });

    testWidgets('toggling show journal switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.showJournal;

      final journalSwitch = find.ancestor(
        of: find.text('Show journal'),
        matching: find.byType(SwitchListTile),
      );

      await tester.tap(journalSwitch);
      await tester.pump();

      expect(settingsProvider.showJournal, !initialValue);
    });

    testWidgets('canceling theme dialog closes it', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      await tester.tap(find.text('Theme'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(find.text('Theme mode'), findsNothing);
    });

    testWidgets('toggling alcohol switch works', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.showAlcohol;

      final alcoholSwitch = find.ancestor(
        of: find.text('Show alcohol tracking'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        alcoholSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(alcoholSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.showAlcohol, !initialValue);
    });

    testWidgets('toggling swipe between tabs switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.swipeTabs;

      final swipeTabsSwitch = find.ancestor(
        of: find.text('Swipe between tabs'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        swipeTabsSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(swipeTabsSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.swipeTabs, !initialValue);
    });

    testWidgets('toggling vaping switch works', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.showVaping;

      final vapingSwitch = find.ancestor(
        of: find.text('Show vaping tracking'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        vapingSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(vapingSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.showVaping, !initialValue);
    });

    testWidgets('toggling smoking switch works', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.showSmoking;

      final smokingSwitch = find.ancestor(
        of: find.text('Show smoking tracking'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        smokingSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(smokingSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.showSmoking, !initialValue);
    });

    testWidgets('toggling marijuana switch works', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.showMarijuana;

      final marijuanaSwitch = find.ancestor(
        of: find.text('Show marijuana tracking'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        marijuanaSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(marijuanaSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.showMarijuana, !initialValue);
    });

    testWidgets('toggling nicotine pouches switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.showNicotinePouches;

      final nicotinePouchesSwitch = find.ancestor(
        of: find.text('Show nicotine pouches tracking'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        nicotinePouchesSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(nicotinePouchesSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.showNicotinePouches, !initialValue);
    });

    testWidgets('toggling opioids switch works', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.showOpioids;

      final opioidsSwitch = find.ancestor(
        of: find.text('Show opioids tracking'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        opioidsSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(opioidsSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.showOpioids, !initialValue);
    });

    testWidgets('toggling social media switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.showSocialMedia;

      final socialMediaSwitch = find.ancestor(
        of: find.text('Show social media tracking'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        socialMediaSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(socialMediaSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.showSocialMedia, !initialValue);
    });

    testWidgets('toggling pornography switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.showPornography;

      final pornographySwitch = find.ancestor(
        of: find.text('Show adult content tracking'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        pornographySwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(pornographySwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.showPornography, !initialValue);
    });

    testWidgets('toggling notify alcohol switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.notifyAlcohol;

      final notifyAlcoholSwitch = find.ancestor(
        of: find.text('Notify alcohol quitting progress'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        notifyAlcoholSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(notifyAlcoholSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.notifyAlcohol, !initialValue);
    });

    testWidgets('toggling notify vaping switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.notifyVaping;

      final notifyVapingSwitch = find.ancestor(
        of: find.text('Notify vaping quitting progress'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        notifyVapingSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(notifyVapingSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.notifyVaping, !initialValue);
    });

    testWidgets('toggling notify smoking switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.notifySmoking;

      final notifySmokingSwitch = find.ancestor(
        of: find.text('Notify smoking quitting progress'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        notifySmokingSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(notifySmokingSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.notifySmoking, !initialValue);
    });

    testWidgets('toggling notify marijuana switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.notifyMarijuana;

      final notifyMarijuanaSwitch = find.ancestor(
        of: find.text('Notify marijuana quitting progress'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        notifyMarijuanaSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(notifyMarijuanaSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.notifyMarijuana, !initialValue);
    });

    testWidgets('toggling notify nicotine pouches switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.notifyPouches;

      final notifyNicotinePouchesSwitch = find.ancestor(
        of: find.text('Notify nicotine pouches quitting progress'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        notifyNicotinePouchesSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(notifyNicotinePouchesSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.notifyPouches, !initialValue);
    });

    testWidgets('toggling notify opioids switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.notifyOpioids;

      final notifyOpioidsSwitch = find.ancestor(
        of: find.text('Notify opioids quitting progress'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        notifyOpioidsSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(notifyOpioidsSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.notifyOpioids, !initialValue);
    });

    testWidgets('toggling notify social media switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.notifySocialMedia;

      final notifySocialMediaSwitch = find.ancestor(
        of: find.text('Notify social media quitting progress'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        notifySocialMediaSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(notifySocialMediaSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.notifySocialMedia, !initialValue);
    });

    testWidgets('toggling notify pornography switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.notifyPornography;

      final notifyPornographySwitch = find.ancestor(
        of: find.text('Notify adult content quitting progress'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        notifyPornographySwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(notifyPornographySwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.notifyPornography, !initialValue);
    });

    testWidgets('toggling notify relapse switch works', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final initialValue = settingsProvider.notifyRelapse;

      final notifyRelapseSwitch = find.ancestor(
        of: find.text('Show positive reinforcement after relapses'),
        matching: find.byType(SwitchListTile),
      );

      await tester.dragUntilVisible(
        notifyRelapseSwitch,
        find.byType(ListView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      await tester.tap(notifyRelapseSwitch);
      await tester.pumpAndSettle();

      expect(settingsProvider.notifyRelapse, !initialValue);
    });

    testWidgets('displays export and import data options', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      await tester.dragUntilVisible(
        find.text('Export data'),
        find.byType(ListView),
        const Offset(0, -300),
      );

      expect(find.text('Export data'), findsOneWidget);

      await tester.dragUntilVisible(
        find.text('Import data'),
        find.byType(ListView),
        const Offset(0, -300),
      );
      expect(find.text('Import data'), findsOneWidget);
      expect(find.byIcon(Icons.upload_file), findsOneWidget);
      expect(find.byIcon(Icons.file_download), findsOneWidget);
    });
  });
}
