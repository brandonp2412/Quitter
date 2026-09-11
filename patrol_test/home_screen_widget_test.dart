import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_widget/home_widget.dart';
import 'package:patrol/patrol.dart';
import 'package:quitter/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

const _nativeTimeout = Duration(seconds: 15);
const _pollInterval = Duration(milliseconds: 200);

Future<void> _eventuallyTrue(
  Future<bool> Function() condition, {
  required Duration timeout,
  required String description,
}) async {
  final deadline = DateTime.now().add(timeout);
  Object? lastError;

  while (DateTime.now().isBefore(deadline)) {
    try {
      if (await condition()) return;
    } catch (error) {
      lastError = error;
    }
    await Future<void>.delayed(_pollInterval);
  }

  fail(
    '$description did not become true within $timeout'
    '${lastError == null ? '' : ' (last error: $lastError)'}',
  );
}

void main() {
  patrolTest(
    'home screen widget can be pinned and configured',
    ($) async {
      if (!Platform.isAndroid) return;

      app.main();

      final preferences = await SharedPreferences.getInstance();
      await preferences.setString('smoking', DateTime.now().toIso8601String());
      await preferences.setString(
        'active_addiction_keys',
        jsonEncode(['smoking']),
      );

      expect(await HomeWidget.isRequestPinWidgetSupported(), isTrue);
      const widgetChannel = MethodChannel('android.widget');
      expect(
        await widgetChannel.invokeMethod<bool>('requestPinWidget'),
        isTrue,
      );

      const addButton = AndroidSelector(textContains: 'Add');
      await $.platform.android.waitUntilVisible(
        addButton,
        timeout: _nativeTimeout,
      );
      await $.platform.android.tap(addButton, timeout: _nativeTimeout);

      await _eventuallyTrue(
        () async =>
            await widgetChannel.invokeMethod<bool>('openUnconfiguredWidget') ??
            false,
        timeout: _nativeTimeout,
        description: 'The newly pinned widget configuration',
      );

      const chooser = AndroidSelector(text: 'Choose what to track');
      await $.platform.android.waitUntilVisible(
        chooser,
        timeout: _nativeTimeout,
      );
      await $.platform.android.tap(const AndroidSelector(text: 'Smoking'));

      await _eventuallyTrue(
        () async =>
            await widgetChannel.invokeMethod<bool>('hasWidgetSelection', {
              'selection': 'smoking',
            }) ??
            false,
        timeout: const Duration(seconds: 10),
        description: 'The widget tracker selection',
      );
    },
    tags: 'home-widget',
    semanticsEnabled: false,
  );
}
