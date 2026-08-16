import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:quitter/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  patrolTest(
    'home screen widget can be pinned and configured',
    ($) async {
      if (!Platform.isAndroid) return;

      app.main();
      await $.pumpAndSettle();

      final preferences = await SharedPreferences.getInstance();
      await preferences.setString('smoking', DateTime.now().toIso8601String());
      await preferences.setString(
        'active_addiction_keys',
        jsonEncode(['smoking']),
      );

      await $.platform.android.pressHome();
      await $.platform.android.swipe(
        from: const Offset(0.5, 0.5),
        to: const Offset(0.5, 0.5),
        steps: 240,
      );
      await $.platform.android.tap(
        const AndroidSelector(textContains: 'Widgets'),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.enterText(
        const AndroidSelector(
          resourceName: 'com.android.launcher3:id/widgets_search_bar_edit_text',
        ),
        text: 'Quitter',
      );
      await $.platform.android.tap(
        const AndroidSelector(
          resourceName: 'com.android.launcher3:id/app_title',
          text: 'Quitter',
        ),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.swipe(
        from: const Offset(0.5, 0.42),
        to: const Offset(0.5, 0.42),
        steps: 240,
      );
      await $.platform.android.waitUntilVisible(
        const AndroidSelector(text: 'Choose what to track'),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.tap(const AndroidSelector(text: 'Smoking'));
      await $.platform.android.pressHome();
      await $.platform.android.swipe(
        from: const Offset(0.9, 0.5),
        to: const Offset(0.1, 0.5),
        steps: 40,
      );
      await $.platform.android.waitUntilVisible(
        const AndroidSelector(text: 'Smoking'),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.waitUntilVisible(
        const AndroidSelector(text: '1 day'),
        timeout: const Duration(seconds: 10),
      );

      // Finish in the app so Flutter can detach the accessibility semantics
      // connection that Patrol used while automating the launcher.
      await $.platform.android.openApp();
      await $.pumpAndSettle();
    },
    tags: 'home-widget',
    semanticsEnabled: false,
  );
}
