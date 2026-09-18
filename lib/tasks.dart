import 'dart:async';
import 'dart:math';
import 'dart:ui' show Locale, PlatformDispatcher;

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:home_widget/home_widget.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/logging.dart';
import 'package:workmanager/workmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/settings_provider.dart';

Timer? timer;
Timer? oneOffReminderTimer;
Timer? periodicStarterTimer;

AppLocalizations _localizationsFor(SharedPreferences prefs) {
  final configuredLocale = prefs.getString('locale');
  final systemLocale = PlatformDispatcher.instance.locale.languageCode;
  final languageCode = configuredLocale == null || configuredLocale == 'system'
      ? systemLocale
      : configuredLocale;
  final supportedLanguageCodes = AppLocalizations.supportedLocales
      .map((locale) => locale.languageCode)
      .toSet();
  final supportedLanguageCode = supportedLanguageCodes.contains(languageCode)
      ? languageCode
      : 'en';
  return lookupAppLocalizations(Locale(supportedLanguageCode));
}

Future<void> setupTasks() async {
  if (kIsWeb) return;

  final now = DateTime.now();

  if (defaultTargetPlatform == TargetPlatform.android) {
    talker.info('Registering Android background tasks');
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
  if (settings.notifyEvery == 0) {
    talker.info('Reminder scheduling disabled by settings');
    await cancelReminderTasks();
    return;
  }

  final hours = settings.notifyAt ~/ 60;
  final minutes = settings.notifyAt % 60;
  var nextReminder = DateTime(now.year, now.month, now.day, hours, minutes);

  if (now.isAfter(nextReminder)) {
    nextReminder = nextReminder.add(Duration(days: settings.notifyEvery));
  }

  final reminderDelay = nextReminder.difference(now);

  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    talker.info('Registering mobile reminder tasks');
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

  oneOffReminderTimer = Timer(reminderDelay, () => doDesktopReminders());
  talker.info('Scheduled desktop reminder timer');

  periodicStarterTimer = Timer(
    reminderDelay + Duration(days: settings.notifyEvery),
    () {
      timer = Timer.periodic(
        Duration(days: settings.notifyEvery),
        (timer) => doDesktopReminders(),
      );
    },
  );
}

/// Sends a local notification preview with the supplied content.
Future<void> testNotification({
  required String title,
  required String body,
}) async {
  talker.info('Sending notification preview');
  final prefs = await SharedPreferences.getInstance();
  final l10n = _localizationsFor(prefs);
  final plugin = await _initializeNotificationPlugin(l10n);
  await _showNotification(plugin, title, body, l10n);
}

String? _validQuitDate(SharedPreferences prefs, String key) {
  final value = prefs.get(key);
  return value is String && DateTime.tryParse(value) != null ? value : null;
}

bool _notificationEnabled(SharedPreferences prefs, String key) {
  return prefs.get('notify_$key') != false;
}

Future<void> testAddictionNotification(
  String prefsKey,
  String displayName,
) async {
  final prefs = await SharedPreferences.getInstance();
  final quitDate = _validQuitDate(prefs, prefsKey);
  if (quitDate == null) {
    talker.warning('Skipped notification preview without a quit date');
    return;
  }

  final days = daysCeil(quitDate);
  final l10n = _localizationsFor(prefs);
  final plugin = await _initializeNotificationPlugin(l10n);
  await _showNotification(
    plugin,
    l10n.notificationProgressTitle(displayName),
    l10n.notificationProgressBody(days, l10n.notificationProgressMessage1),
    l10n,
  );
}

Future<void> testCustomEntryNotification(
  String displayName,
  String quitDateIso,
) async {
  final days = daysCeil(quitDateIso);
  final prefs = await SharedPreferences.getInstance();
  final l10n = _localizationsFor(prefs);
  final plugin = await _initializeNotificationPlugin(l10n);
  await _showNotification(
    plugin,
    l10n.notificationProgressTitle(displayName),
    l10n.notificationProgressBody(days, l10n.notificationProgressMessage1),
    l10n,
  );
}

Future<FlutterLocalNotificationsPlugin> _initializeNotificationPlugin(
  AppLocalizations l10n,
) async {
  final plugin = FlutterLocalNotificationsPlugin();

  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    final androidChannel = AndroidNotificationChannel(
      'reminders_channel_id',
      l10n.notificationChannelName,
      description: l10n.notificationChannelDescription,
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
    await plugin.initialize(settings: initSettings);
  } else {
    final linuxSettings = LinuxInitializationSettings(
      defaultActionName: l10n.notificationOpenAction,
    );
    const darwinSettings = DarwinInitializationSettings();
    const windowsSettings = WindowsInitializationSettings(
      appName: 'Quitter',
      appUserModelId: 'com.quitter.app',
      guid: '32562a7f-d398-4ae3-9ff9-35496b6f60ed',
    );
    final initSettings = InitializationSettings(
      linux: linuxSettings,
      macOS: darwinSettings,
      windows: windowsSettings,
    );
    await plugin.initialize(settings: initSettings);
  }

  return plugin;
}

Future<void> _showNotification(
  FlutterLocalNotificationsPlugin plugin,
  String title,
  String body,
  AppLocalizations l10n,
) async {
  final notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'reminders_channel_id',
      l10n.notificationChannelName,
      channelDescription: l10n.notificationChannelDescription,
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
    id: Random().nextInt(1000),
    title: title,
    body: body,
    notificationDetails: notificationDetails,
  );
}

Future<void> notifyProgress(
  FlutterLocalNotificationsPlugin plugin,
  SharedPreferences prefs,
  AppLocalizations l10n,
) async {
  final random = Random();

  final List<Map<String, String>> journeys = [
    {'key': 'adderall', 'name': l10n.addictionAdderall},
    {'key': 'ssri', 'name': l10n.addictionSsri},
    {'key': 'snri', 'name': l10n.addictionSnri},
    {'key': 'tca', 'name': l10n.addictionTca},
    {'key': 'maoi', 'name': l10n.addictionMaoi},
    {'key': 'alcohol', 'name': l10n.addictionAlcohol},
    {'key': 'benzos', 'name': l10n.addictionBenzos},
    {'key': 'vaping', 'name': l10n.addictionVaping},
    {'key': 'smoking', 'name': l10n.addictionSmoking},
    {'key': 'marijuana', 'name': l10n.addictionMarijuana},
    {'key': 'opioids', 'name': l10n.addictionOpioids},
    {'key': 'nicotine_pouches', 'name': l10n.addictionNicotinePouches},
    {'key': 'social_media', 'name': l10n.addictionSocialMedia},
    {'key': 'pornography', 'name': l10n.addictionAdultContent},
    {'key': 'cocaine', 'name': l10n.addictionCocaine},
    {'key': 'meth', 'name': l10n.addictionMeth},
    {'key': 'nitrous_oxide', 'name': l10n.addictionNitrousOxide},
    {'key': 'kratom', 'name': l10n.addictionKratom},
    {'key': 'gabapentinoids', 'name': l10n.addictionGabapentinoid},
    {'key': 'ghb', 'name': l10n.addictionGhb},
    {'key': 'ketamine', 'name': l10n.addictionKetamine},
    {'key': 'inhalants', 'name': l10n.addictionInhalants},
    {
      'key': 'synthetic_cannabinoids',
      'name': l10n.addictionSyntheticCannabinoids,
    },
    {'key': 'mdma', 'name': l10n.addictionMdma},
    {'key': 'steroids', 'name': l10n.addictionSteroids},
    {'key': 'heroin', 'name': l10n.addictionHeroin},
    {'key': 'fentanyl', 'name': l10n.addictionFentanyl},
    {'key': 'smokeless_tobacco', 'name': l10n.addictionSmokelessTobacco},
  ];

  final List<String> messages = [
    l10n.notificationProgressMessage1,
    l10n.notificationProgressMessage2,
    l10n.notificationProgressMessage3,
    l10n.notificationProgressMessage4,
    l10n.notificationProgressMessage5,
    l10n.notificationProgressMessage6,
    l10n.notificationProgressMessage7,
    l10n.notificationProgressMessage8,
    l10n.notificationProgressMessage9,
    l10n.notificationProgressMessage10,
  ];

  final activeJourneys = journeys.where((journey) {
    final key = journey['key']!;
    return _validQuitDate(prefs, key) != null &&
        _notificationEnabled(prefs, key);
  }).toList();

  final addiction = AddictionProvider();
  await addiction.loadAddictions();

  final activeEntries = addiction.entries
      .where((e) => prefs.get('notify_entry_${e.id}') != false)
      .toList();

  if (activeJourneys.isEmpty && activeEntries.isEmpty) {
    talker.info('Skipped reminder; no active journeys');
    return;
  }

  final randomMessage = messages[random.nextInt(messages.length)];
  String notificationTitle;
  String notificationBody;

  if (activeJourneys.isNotEmpty &&
      activeEntries.isNotEmpty &&
      random.nextBool()) {
    final randomEntry = activeEntries[random.nextInt(activeEntries.length)];
    final entryCount = daysCeil(randomEntry.quitDate.toIso8601String());
    notificationTitle = l10n.notificationProgressTitle(randomEntry.title);
    notificationBody = l10n.notificationProgressBody(entryCount, randomMessage);
  } else if (activeJourneys.isNotEmpty) {
    final randomJourney = activeJourneys[random.nextInt(activeJourneys.length)];
    final journeyDate = _validQuitDate(prefs, randomJourney['key']!);
    if (journeyDate == null) return;
    final journeyCount = daysCeil(journeyDate);
    notificationTitle = l10n.notificationProgressTitle(randomJourney['name']!);
    notificationBody = l10n.notificationProgressBody(
      journeyCount,
      randomMessage,
    );
  } else {
    final randomEntry = activeEntries[random.nextInt(activeEntries.length)];
    final entryCount = daysCeil(randomEntry.quitDate.toIso8601String());
    notificationTitle = l10n.notificationProgressTitle(randomEntry.title);
    notificationBody = l10n.notificationProgressBody(entryCount, randomMessage);
  }

  await _showNotification(plugin, notificationTitle, notificationBody, l10n);
  talker.info('Delivered progress reminder');
}

Future<void> doDesktopReminders() async {
  final prefs = await SharedPreferences.getInstance();
  final l10n = _localizationsFor(prefs);
  final plugin = await _initializeNotificationPlugin(l10n);
  await notifyProgress(plugin, prefs, l10n);
}

Future<void> cancelReminderTasks() async {
  if (kIsWeb) return;

  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    talker.info('Cancelling mobile reminder tasks');
    await Future.wait([
      Workmanager().cancelByUniqueName('reminders'),
      Workmanager().cancelByUniqueName('reminder_oneoff'),
    ]);
    return;
  }

  oneOffReminderTimer?.cancel();
  oneOffReminderTimer = null;
  periodicStarterTimer?.cancel();
  periodicStarterTimer = null;
  timer?.cancel();
  timer = null;
  talker.info('Cancelled desktop reminder timers');
}

Future<void> cancelTasks() async {
  if (kIsWeb) return;

  await cancelReminderTasks();
  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    talker.info('Cancelling mobile widget tasks');
    await Future.wait([
      Workmanager().cancelByUniqueName('widgets'),
      Workmanager().cancelByUniqueName('widget_oneoff'),
    ]);
  }
}

Future<void> rescheduleTasks() async {
  await cancelTasks();
  await setupTasks();
}

Future<void> doMobileReminders() async {
  final prefs = await SharedPreferences.getInstance();
  final l10n = _localizationsFor(prefs);
  final plugin = await _initializeNotificationPlugin(l10n);
  await notifyProgress(plugin, prefs, l10n);
}

@pragma('vm:entry-point')
void taskHandler() {
  if (defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS) {
    talker.warning(
      'Background task handler invoked on an unsupported platform',
    );
    return;
  }

  Workmanager().executeTask((task, inputData) async {
    talker.info('Received background task: $task');
    try {
      switch (task) {
        case 'reminders':
          await doMobileReminders();
          talker.info('Completed reminder background task');
          return true;
        case 'widgets':
          await HomeWidget.updateWidget(name: 'QuitTrackerWidget');
          talker.info('Completed widget background task');
          return true;
        default:
          talker.warning('Ignoring unknown background task: $task');
          return false;
      }
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace, 'Background task failed: $task');
      return false;
    }
  });
}
