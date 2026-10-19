package com.quitter.app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "android.widget")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "scheduleWidgetUpdates" -> {
                        QuitTrackerWidgetWorker.schedule(applicationContext)
                        result.success(null)
                    }

                    else -> result.notImplemented()
                }
            }
    }
}
