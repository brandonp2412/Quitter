import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:workmanager/workmanager.dart';

/// Ensure homescreen widgets are updated every morning.
void setupHomeWidget() async {
  if (defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS)
    return;

  final now = DateTime.now();
  var nextRun = DateTime(now.year, now.month, now.day, 0, 0);
  if (now.isAfter(nextRun)) {
    nextRun = nextRun.add(Duration(days: 1));
  }
  final initialDelay = nextRun.difference(now);

  Workmanager().initialize(doWidgetUpdate);

  Workmanager().registerOneOffTask(
    "widget_oneoff",
    "widgets",
    initialDelay: initialDelay,
  );

  Workmanager().registerPeriodicTask(
    "widgets",
    "widgets",
    frequency: Duration(days: 1),
    initialDelay: initialDelay + Duration(days: 1),
  );
}

@pragma('vm:entry-point')
void doWidgetUpdate() {
  Workmanager().executeTask((task, inputData) async {
    const widgetChannel = MethodChannel("android.widget");
    try {
      await widgetChannel.invokeMethod('updateWidget');
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  });
}
