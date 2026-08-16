package com.quitter.app

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Intent
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "android.widget")
            .setMethodCallHandler { call, result ->
                val manager = AppWidgetManager.getInstance(this)
                val provider = ComponentName(this, QuitTrackerWidget::class.java)
                when (call.method) {
                    "requestPinWidget" -> {
                        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O ||
                            !manager.isRequestPinAppWidgetSupported
                        ) {
                            result.success(false)
                            return@setMethodCallHandler
                        }

                        val callback = PendingIntent.getActivity(
                            this,
                            0,
                            Intent(this, WidgetSelectionActivity::class.java),
                            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_MUTABLE
                        )
                        result.success(manager.requestPinAppWidget(provider, null, callback))
                    }
                    "newestWidgetSelection" -> {
                        val appWidgetId = manager.getAppWidgetIds(provider).maxOrNull()
                        val selection = appWidgetId?.let {
                            getSharedPreferences("QuitTrackerWidget", MODE_PRIVATE)
                                .getString("selected_$it", null)
                        }
                        result.success(selection)
                    }
                    else -> result.notImplemented()
                }
            }
    }
}
