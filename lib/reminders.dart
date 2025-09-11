import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/settings_provider.dart';

Timer? timer;

Future<void> setupReminders() async {
  if (kIsWeb) return;

  final settingsProvider = SettingsProvider();
  await settingsProvider.loadPreferences();
  final notifyEveryDays = settingsProvider.notifyEvery;

  if (notifyEveryDays == 0) return cancelReminders();
  if (Platform.isAndroid || Platform.isIOS) {
    Workmanager().initialize(doMobileReminders);
    Workmanager().registerPeriodicTask(
      "reminders",
      "reminders",
      frequency: Duration(days: notifyEveryDays),
    );
  } else {
    timer = Timer.periodic(
      Duration(days: notifyEveryDays),
      (timer) => doDesktopReminders(),
    );
  }
}

Future<void> notifyProgress(FlutterLocalNotificationsPlugin plugin) async {
  final prefs = await SharedPreferences.getInstance();
  final random = Random();

  final List<Map<String, String>> journeys = [
    {'key': 'alcohol', 'name': 'Alcohol'},
    {'key': 'vaping', 'name': 'Vaping'},
    {'key': 'smoking', 'name': 'Smoking'},
    {'key': 'opioids', 'name': 'Opioids'},
  ];

  final List<String> messages = [
    "Keep up the amazing work!",
    "You're doing great!",
    "Incredible dedication!",
    "Celebrating your strength!",
    "Keep shining!",
    "Awesome job!",
    "Way to go!",
    "You're a true champion!",
    "Remarkable effort!",
    "Stay strong!",
  ];

  final activeJourneys = journeys
      .where(
        (journey) =>
            prefs.getString(journey['key']!) != null &&
            prefs.getBool("notify_${journey['key']}") != false,
      )
      .toList();

  if (activeJourneys.isEmpty) {
    return;
  }

  final selectedJourney = activeJourneys[random.nextInt(activeJourneys.length)];
  final quitDateString = prefs.getString(selectedJourney['key']!);
  final days = daysCeil(quitDateString!);

  final randomMessage = messages[random.nextInt(messages.length)];
  final notificationTitle =
      "No ${selectedJourney['name']!.toLowerCase()} for $days days";
  final notificationBody = randomMessage;

  final notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'reminders_channel_id',
      'Reminders',
      channelDescription: 'Notifications for daily progress reminders',
      importance: Importance.high,
      priority: Priority.high,
      icon: 'neurology',
    ),
    iOS: DarwinNotificationDetails(),
  );

  await plugin.show(
    random.nextInt(1000),
    notificationTitle,
    notificationBody,
    notificationDetails,
  );
}

Future<void> doDesktopReminders() async {
  const linux = LinuxInitializationSettings(
    defaultActionName: 'Open notification',
  );
  const darwin = DarwinInitializationSettings();
  const init = InitializationSettings(linux: linux, macOS: darwin);
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(init);

  await notifyProgress(plugin);
}

void cancelReminders() {
  if (kIsWeb) return;

  if (Platform.isAndroid || Platform.isIOS) {
    Workmanager().cancelByUniqueName('reminders');
  } else {
    timer?.cancel();
  }
}

/// This is used by WorkManager so you can't reference any external variables.
@pragma('vm:entry-point')
void doMobileReminders() {
  Workmanager().executeTask((task, inputData) async {
    try {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'reminders_channel_id',
        'Reminders',
        description: 'Notifications for daily progress reminders',
        importance: Importance.high,
      );

      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(channel);

      const darwin = DarwinInitializationSettings();
      const android = AndroidInitializationSettings('neurology');
      const init = InitializationSettings(iOS: darwin, android: android);
      await flutterLocalNotificationsPlugin.initialize(init);

      await notifyProgress(flutterLocalNotificationsPlugin);

      print('[Workmanager] Task "reminders" completed successfully.');
      return Future.value(true);
    } catch (e, stacktrace) {
      print('[Workmanager] Error executing task "reminders": $e');
      print('[Workmanager] Stacktrace: $stacktrace');
      return Future.value(false);
    }
  });
}
