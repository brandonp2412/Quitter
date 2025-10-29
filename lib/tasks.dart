import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_widget/home_widget.dart';
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
  if (settings.notifyEvery == 0) return cancelTasks();

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

/// Test method to send a notification with custom title and body
/// Call this from anywhere in your app to test notifications
Future<void> testNotification({
  required String title,
  required String body,
}) async {
  final plugin = await _initializeNotificationPlugin();
  await _showNotification(plugin, title, body);
}

/// Initialize notification plugin based on platform
Future<FlutterLocalNotificationsPlugin> _initializeNotificationPlugin() async {
  final plugin = FlutterLocalNotificationsPlugin();

  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    const androidChannel = AndroidNotificationChannel(
      'reminders_channel_id',
      'Reminders',
      description: 'Notifications for daily progress reminders',
      importance: Importance.high,
    );

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
  } else {
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
    await plugin.initialize(initSettings);
  }

  return plugin;
}

/// Show a notification with given title and body
Future<void> _showNotification(
  FlutterLocalNotificationsPlugin plugin,
  String title,
  String body,
) async {
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

  await plugin.show(Random().nextInt(1000), title, body, notificationDetails);
}

Future<void> notifyProgress(FlutterLocalNotificationsPlugin plugin) async {
  final storage = FlutterSecureStorage();
  final random = Random();

  final List<Map<String, String>> journeys = [
    {'key': 'alcohol', 'name': 'Alcohol'},
    {'key': 'vaping', 'name': 'Vaping'},
    {'key': 'smoking', 'name': 'Smoking'},
    {'key': 'marijuana', 'name': 'Marijuana'},
    {'key': 'opioids', 'name': 'Opioids'},
    {'key': 'nicotine_pouches', 'name': 'Nicotine pouches'},
    {'key': 'social_media', 'name': 'Social media'},
    {'key': 'pornography', 'name': 'AC'},
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

  List<Map<String, String>> activeJourneys = [];
  for (final journey in journeys) {
    if (await storage.read(key: journey['key'] ?? '') != null &&
        await storage.read(key: "notify_${journey['key']}") != 'false')
      activeJourneys.add(journey);
  }

  final addiction = AddictionProvider();
  await addiction.loadAddictions();

  if (activeJourneys.isEmpty && addiction.entries.isEmpty) return;

  final randomJourney = activeJourneys[random.nextInt(activeJourneys.length)];
  final journeyDate = await storage.read(key: randomJourney['key']!);
  final journeyCount = daysCeil(journeyDate!);

  final randomMessage = messages[random.nextInt(messages.length)];
  var notificationTitle =
      "No ${randomJourney['name']!.toLowerCase()} for $journeyCount days";
  final notificationBody = randomMessage;

  if (addiction.entries.isNotEmpty && random.nextBool()) {
    final randomEntry =
        addiction.entries[random.nextInt(addiction.entries.length)];
    final entryCount = daysCeil(randomEntry.quitDate.toIso8601String());
    notificationTitle = "No ${randomEntry.title} for $entryCount days";
  }

  await _showNotification(plugin, notificationTitle, notificationBody);
}

Future<void> doDesktopReminders() async {
  final plugin = await _initializeNotificationPlugin();
  await notifyProgress(plugin);
}

void cancelTasks() {
  if (kIsWeb) return;

  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    Workmanager().cancelByUniqueName('reminders');
    Workmanager().cancelByUniqueName('reminder_oneoff');
    Workmanager().cancelByUniqueName('widgets');
    Workmanager().cancelByUniqueName('widget_oneoff');
    return;
  }

  timer?.cancel();
}

Future<void> doMobileReminders() async {
  final plugin = await _initializeNotificationPlugin();
  await notifyProgress(plugin);
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
    print('[Workmanager] task received $task');
    switch (task) {
      case 'reminders':
        await doMobileReminders();
        print('[Workmanager] Task "reminders" completed successfully.');
        return Future.value(true);
      case 'widgets':
        await HomeWidget.updateWidget(name: 'QuitTrackerWidget');
        return Future.value(true);
      default:
        return Future.value(false);
    }
  });
}
