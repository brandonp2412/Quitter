import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:workmanager/workmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/settings_provider.dart';

Timer? timer;

Future<void> setupTasks() async {
  if (kIsWeb) return;

  final now = DateTime.now();

  if (defaultTargetPlatform == TargetPlatform.android) {
    Workmanager().initialize(taskHandler);
    var nextWidget = DateTime(now.year, now.month, now.day, 0, 0);
    if (now.isAfter(nextWidget)) {
      nextWidget = nextWidget.add(Duration(days: 1));
    }
    final widgetDelay = nextWidget.difference(now);
    Workmanager().registerOneOffTask(
      "widget_oneoff",
      "widgets",
      initialDelay: widgetDelay,
    );
    Workmanager().registerPeriodicTask(
      "widgets",
      "widgets",
      frequency: Duration(days: 1),
      initialDelay: widgetDelay + Duration(days: 1),
    );
  }

  final settings = SettingsProvider();
  await settings.loadPreferences();
  if (settings.notifyEvery == 0) return cancelReminders();

  final hours = settings.notifyAt ~/ 60;
  final minutes = settings.notifyAt % 60;
  var nextReminder = DateTime(now.year, now.month, now.day, hours, minutes);

  if (now.isAfter(nextReminder)) {
    nextReminder = nextReminder.add(Duration(days: settings.notifyEvery));
  }

  final reminderDelay = nextReminder.difference(now);

  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    Workmanager().registerOneOffTask(
      "reminder_oneoff",
      "reminders",
      initialDelay: reminderDelay,
    );

    Workmanager().registerPeriodicTask(
      "reminders",
      "reminders",
      frequency: Duration(days: settings.notifyEvery),
      initialDelay: reminderDelay + Duration(days: settings.notifyEvery),
    );

    return;
  }

  Timer(reminderDelay, () => doDesktopReminders());

  Timer(reminderDelay + Duration(days: settings.notifyEvery), () {
    timer = Timer.periodic(
      Duration(days: settings.notifyEvery),
      (timer) => doDesktopReminders(),
    );
  });
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

  final addiction = AddictionProvider();
  await addiction.loadAddictions();

  if (activeJourneys.isEmpty && addiction.entries.isEmpty) return;

  final randomEntry =
      addiction.entries[random.nextInt(addiction.entries.length)];
  final randomJourney = activeJourneys[random.nextInt(activeJourneys.length)];
  final journeyDate = prefs.getString(randomJourney['key']!);
  final journeyCount = daysCeil(journeyDate!);
  final entryCount = daysCeil(randomEntry.quitDate.toIso8601String());

  final randomMessage = messages[random.nextInt(messages.length)];
  var notificationTitle =
      "No ${randomJourney['name']!.toLowerCase()} for $journeyCount days";
  final notificationBody = randomMessage;

  if (random.nextBool()) {
    notificationTitle = "No ${randomEntry.title} for $entryCount days";
  }

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
void taskHandler() {
  if (defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS) {
    print(
      '[Workmanager] doMobileReminders called on unsupported platform: $defaultTargetPlatform',
    );
    return;
  }

  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case 'reminders':
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
      case 'widgets':
        const widgetChannel = MethodChannel("android.widget");
        await widgetChannel.invokeMethod('updateWidget');
        return Future.value(true);
      default:
        return Future.value(false);
    }
  });
}
