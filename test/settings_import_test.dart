import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/tasks.dart' as tasks;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  tearDown(() {
    tasks.oneOffReminderTimer?.cancel();
    tasks.oneOffReminderTimer = null;
    tasks.periodicStarterTimer?.cancel();
    tasks.periodicStarterTimer = null;
    tasks.timer?.cancel();
    tasks.timer = null;
    debugDefaultTargetPlatformOverride = null;
  });

  test('import disabling reminders cancels the existing schedule', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    SharedPreferences.setMockInitialValues({
      'notify_every': 1,
      'notify_at': 8 * 60,
      'alcohol': DateTime(2026, 1, 1).toIso8601String(),
    });

    final settings = SettingsProvider();
    final addictions = AddictionProvider();
    await Future.wait([
      settings.loadPreferences(),
      addictions.loadAddictions(),
    ]);

    final periodic = Timer.periodic(const Duration(days: 1), (_) {});
    final oneOff = Timer(const Duration(days: 1), () {});
    final starter = Timer(const Duration(days: 1), () {});
    tasks.timer = periodic;
    tasks.oneOffReminderTimer = oneOff;
    tasks.periodicStarterTimer = starter;

    await applyImportedPreferences(
      {
        'notify_every': 0,
        'notify_at': 8 * 60,
        'alcohol': DateTime(2026, 1, 1).toIso8601String(),
      },
      addictions: addictions,
      settings: settings,
    );

    expect(settings.notifyEvery, 0);
    expect(periodic.isActive, isFalse);
    expect(oneOff.isActive, isFalse);
    expect(starter.isActive, isFalse);
  });
}
