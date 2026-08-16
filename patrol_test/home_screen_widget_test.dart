import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:home_widget/home_widget.dart';
import 'package:patrol/patrol.dart';
import 'package:quitter/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  patrolTest(
    'home screen widget can be pinned, configured, and opened',
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

      expect(await HomeWidget.isRequestPinWidgetSupported(), isTrue);
      await HomeWidget.requestPinWidget(androidName: 'QuitTrackerWidget');

      await $.platform.android.tap(
        const AndroidSelector(text: 'Add'),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.mobile.pressHome();

      await $.platform.android.tap(
        const AndroidSelector(textContains: 'Tap to'),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.waitUntilVisible(
        const AndroidSelector(text: 'Choose what to track'),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.tap(const AndroidSelector(text: 'Smoking'));

      await $.platform.android.waitUntilVisible(
        const AndroidSelector(text: 'Smoking'),
        timeout: const Duration(seconds: 10),
      );
      await $.platform.android.waitUntilVisible(
        const AndroidSelector(text: '1 day'),
        timeout: const Duration(seconds: 10),
      );

      await $.platform.android.tap(const AndroidSelector(text: 'Smoking'));
      await $.pumpAndSettle();

      expect($('Quitter'), findsWidgets);
    },
    tags: 'home-widget',
  );
}
