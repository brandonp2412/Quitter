import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:patrol/patrol.dart';
import 'package:quitter/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  patrolTest('home screen widget can be pinned and configured', ($) async {
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
    const widgetChannel = MethodChannel('android.widget');
    expect(await widgetChannel.invokeMethod<bool>('requestPinWidget'), isTrue);

    await $.platform.android.tap(
      const AndroidSelector(text: 'Add to home screen'),
      timeout: const Duration(seconds: 10),
    );
    await $.platform.android.waitUntilVisible(
      const AndroidSelector(text: 'Choose what to track'),
      timeout: const Duration(seconds: 10),
    );
    await $.platform.android.tap(const AndroidSelector(text: 'Smoking'));

    var hasSelection = false;
    final selectionTimeout = Stopwatch()..start();
    while (!hasSelection &&
        selectionTimeout.elapsed < const Duration(seconds: 5)) {
      hasSelection =
          await widgetChannel.invokeMethod<bool>('hasWidgetSelection', {
            'selection': 'smoking',
          }) ??
          false;
      if (!hasSelection) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
      }
    }
    expect(
      hasSelection,
      isTrue,
      reason:
          'No bound Quitter widget persisted the tracker selected in the native chooser.',
    );
  }, tags: 'home-widget');
}
