package com.quitter.app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "android.widget")
            .setMethodCallHandler { call, result ->
                if (call.method !in listOf("scheduleWidgetUpdates", "replaceReminders")) {
                    result.notImplemented()
                    return@setMethodCallHandler
                }
                ReminderScheduler.executor.execute {
                    try {
                        when (call.method) {
                            "scheduleWidgetUpdates" -> {
                                ReminderScheduler.cancelLegacyWorkers(applicationContext)
                                QuitTrackerWidgetWorker.schedule(applicationContext)
                            }
                            "replaceReminders" -> ReminderScheduler.replace(
                                applicationContext,
                                call.argument<List<Map<String, Any?>>>("records") ?: emptyList(),
                                call.argument<String>("channelName") ?: "Reminders",
                                call.argument<String>("channelDescription") ?: ""
                            )
                        }
                        runOnUiThread { result.success(null) }
                    } catch (error: Exception) {
                        runOnUiThread { result.error("REMINDER_ERROR", error.message, null) }
                    }
                }
            }
    }
}
