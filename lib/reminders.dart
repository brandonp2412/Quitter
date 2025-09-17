import 'dart:async';
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
  final notifyDays = settingsProvider.notifyEvery;

  if (notifyDays == 0) return cancelReminders();

  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    Workmanager().initialize(doMobileReminders);
    Workmanager().registerPeriodicTask(
      "reminders",
      "reminders",
      frequency: Duration(days: notifyDays),
    );
    return;
  }

  timer = Timer.periodic(
    Duration(days: notifyDays),
    (timer) => doDesktopReminders(),
  );
}

Future<void> notifyProgress(FlutterLocalNotificationsPlugin plugin) async {
  final prefs = await SharedPreferences.getInstance();
  final random = Random();

  final List<Map<String, String>> journeys = [
    {'key': 'alcohol', 'name': 'Alcohol'},
    {'key': 'vaping', 'name': 'Vaping'},
    {'key': 'smoking', 'name': 'Smoking'},
    {'key': 'marijuana', 'name': 'Marijuana'},
    {'key': 'opioids', 'name': 'Opioids'},
    {'key': 'nicotine_pouches', 'name': 'Nicotine pouches'},
    {'key': 'social_media', 'name': 'Social media'},
    {'key': 'pornography', 'name': 'Pornography'},
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

  if (activeJourneys.isEmpty) return;

  final selectedJourney = activeJourneys[random.nextInt(activeJourneys.length)];
  final quitDateString = prefs.getString(selectedJourney['key']!);
  final daysCount = daysCeil(quitDateString!);

  final randomMessage = messages[random.nextInt(messages.length)];
  final notificationTitle =
      "No ${selectedJourney['name']!.toLowerCase()} for $daysCount days";
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
    linux: LinuxNotificationDetails(),
    macOS: DarwinNotificationDetails(),
    windows: WindowsNotificationDetails(),
  );

  await plugin.show(
    random.nextInt(1000),
    notificationTitle,
    notificationBody,
    notificationDetails,
  );
}

Future<void> doDesktopReminders() async {
  const linuxSettings = LinuxInitializationSettings(
    defaultActionName: 'Open notification',
  );
  const darwinSettings = DarwinInitializationSettings();
  const windowsSettings = WindowsInitializationSettings(
    appName: 'Quitter',
    appUserModelId: 'com.quitter.app',
    guid: '32562a7f-d398-4ae3-9ff9-35496b6f60ed',
  );
  const initSettings = InitializationSettings(
    linux: linuxSettings,
    macOS: darwinSettings,
    windows: windowsSettings,
  );
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(initSettings);

  await notifyProgress(plugin);
}

void cancelReminders() {
  if (kIsWeb) return;

  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    Workmanager().cancelByUniqueName('reminders');
    return;
  }

  timer?.cancel();
}

@pragma('vm:entry-point')
void doMobileReminders() {
  if (defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS) {
    print(
      '[Workmanager] doMobileReminders called on unsupported platform: $defaultTargetPlatform',
    );
    return;
  }

  Workmanager().executeTask((task, inputData) async {
    try {
      const androidChannel = AndroidNotificationChannel(
        'reminders_channel_id',
        'Reminders',
        description: 'Notifications for daily progress reminders',
        importance: Importance.high,
      );

      final plugin = FlutterLocalNotificationsPlugin();

      await plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(androidChannel);

      const darwinSettings = DarwinInitializationSettings();
      const androidSettings = AndroidInitializationSettings('neurology');
      const initSettings = InitializationSettings(
        iOS: darwinSettings,
        android: androidSettings,
      );
      await plugin.initialize(initSettings);

      await notifyProgress(plugin);

      print('[Workmanager] Task "reminders" completed successfully.');
      return Future.value(true);
    } catch (error, stacktrace) {
      print('[Workmanager] Error executing task "reminders": $error');
      print('[Workmanager] Stacktrace: $stacktrace');
      return Future.value(false);
    }
  });
}
