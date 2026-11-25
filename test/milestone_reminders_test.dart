import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/l10n/generated/app_localizations_en.dart';
import 'package:quitter/milestone_reminders.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final l10n = AppLocalizationsEn();

  test('milestone reminders use the journey’s own timeline', () {
    final quitDate = DateTime(2026, 9, 24);
    List<int> upcomingDays(String? key) => upcomingMilestoneDates(
      quitDate: quitDate,
      now: quitDate,
      at: 8 * 60 + 30,
      predefinedDays: milestonesForJourney(l10n, key).map((m) => m.day),
    ).take(10).map((m) => m.day).toList();

    expect(upcomingDays('nicotine_pouches'), [
      1,
      3,
      7,
      14,
      365,
      400,
      500,
      600,
      700,
      730,
    ]);
    expect(upcomingDays('benzos'), [
      7,
      14,
      60,
      90,
      180,
      365,
      400,
      500,
      540,
      600,
    ]);
    expect(upcomingDays(null), [1, 3, 7, 14, 30, 90, 180, 365, 400, 500]);
  });

  test('reminders use the timeline day and configured local time', () {
    final quitDate = DateTime(2026, 9, 24, 12);
    final now = DateTime(2026, 9, 26, 8, 30);
    final dates = upcomingMilestoneDates(
      quitDate: quitDate,
      now: now,
      at: 8 * 60 + 30,
      predefinedDays: [1, 3, 4, 7, 365, 400],
    ).take(5).toList();
    expect(dates.map((m) => m.day), [4, 7, 365, 400, 500]);
    for (final milestone in dates) {
      expect(milestone.date.hour, 8);
      expect(milestone.date.minute, 30);
      expect(
        daysCeilAt(quitDate.toIso8601String(), milestone.date),
        milestone.day,
      );
    }
  });

  test('milestone mode stays enabled with a zero-day interval', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    SharedPreferences.setMockInitialValues({'notify_every': 0});
    final settings = SettingsProvider();
    await settings.loadPreferences();
    expect(settings.remindersEnabled, isFalse);

    await settings.setNotificationSchedule(
      days: 0,
      at: 540,
      onMilestones: true,
    );

    final reloaded = SettingsProvider();
    await reloaded.loadPreferences();
    expect(reloaded.remindersEnabled, isTrue);
    expect(reloaded.notifyOnMilestones, isTrue);
    expect(reloaded.notifyEvery, 0);
    expect(reloaded.notifyAt, 540);

    await reloaded.setNotificationSchedule(days: 0, at: 540);
    await settings.loadPreferences();
    expect(settings.remindersEnabled, isFalse);
  });
}
