import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quitter/main.dart' as app;
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/vaping_page.dart';
import 'package:quitter/settings_provider.dart';

Future<void> appWrapper() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsProvider = SettingsProvider();
  await settingsProvider.loadPreferences();
  runApp(
    ChangeNotifierProvider.value(
      value: settingsProvider,
      child: const app.QuitterApp(),
    ),
  );
}

void navigateTo({required BuildContext context, required Widget page}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

Future<void> generateScreenshot({
  required IntegrationTestWidgetsFlutterBinding binding,
  required WidgetTester tester,
  required String screenshotName,
  Future<void> Function(BuildContext context)? navigateToPage,
  bool skipSettle = false,
}) async {
  await appWrapper();
  await tester.pumpAndSettle();

  if (navigateToPage != null) {
    final BuildContext context = tester.element(find.byType(app.HomePage));
    await navigateToPage(context);
  }

  skipSettle ? await tester.pump() : await tester.pumpAndSettle();
  await binding.convertFlutterSurfaceToImage();
  skipSettle ? await tester.pump() : await tester.pumpAndSettle();
  await binding.takeScreenshot(screenshotName);
}

void main() {
  IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setInt('notify_every', 0);
    await prefs.setString(
      'vaping',
      DateTime.now().subtract(const Duration(days: 3)).toIso8601String(),
    );
    await prefs.setString(
      'smoking',
      DateTime.now().subtract(const Duration(days: 7)).toIso8601String(),
    );
    await prefs.setString(
      'marijuana',
      DateTime.now().subtract(const Duration(days: 14)).toIso8601String(),
    );
    await prefs.setString(
      'nicotine_pouches',
      DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
    );
    await prefs.setString(
      'opioids',
      DateTime.now().subtract(const Duration(days: 60)).toIso8601String(),
    );
    await prefs.setString(
      'social_media',
      DateTime.now().subtract(const Duration(days: 90)).toIso8601String(),
    );
    await prefs.setString(
      'pornography',
      DateTime.now().subtract(const Duration(days: 180)).toIso8601String(),
    );
  });

  group("Generate Quitter App Screenshots", () {
    testWidgets(
      "HomePage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '1_home_page_en-US',
      ),
    );

    testWidgets(
      "AlcoholPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '2_alcohol_page_en-US',
        navigateToPage: (context) async => navigateTo(
          context: context,
          page: const AlcoholPage(initialStarted: true),
        ),
      ),
    );

    testWidgets(
      "SmokingPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '3_smoking_page_en-US',
        navigateToPage: (context) async => navigateTo(
          context: context,
          page: const SmokingPage(initialStarted: true),
        ),
      ),
    );

    testWidgets(
      "VapingPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '4_vaping_page_en-US',
        navigateToPage: (context) async => navigateTo(
          context: context,
          page: const VapingPage(initialStarted: true),
        ),
      ),
    );

    testWidgets(
      "OpioidPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '5_opioid_page_en-US',
        navigateToPage: (context) async => navigateTo(
          context: context,
          page: const OpioidPage(initialStarted: true),
        ),
      ),
    );

    testWidgets(
      "MarijuanaPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '6_marijuana_page_en-US',
        navigateToPage: (context) async => navigateTo(
          context: context,
          page: const MarijuanaPage(initialStarted: true),
        ),
      ),
    );

    testWidgets(
      "NicotinePouchesPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '7_nicotine_pouches_page_en-US',
        navigateToPage: (context) async => navigateTo(
          context: context,
          page: const NicotinePouchesPage(initialStarted: true),
        ),
      ),
    );

    testWidgets(
      "SettingsPage",
      (tester) async => await generateScreenshot(
        binding: binding,
        tester: tester,
        screenshotName: '8_settings_page_en-US',
        navigateToPage: (context) async =>
            navigateTo(context: context, page: const SettingsPage()),
      ),
    );
  });
}
