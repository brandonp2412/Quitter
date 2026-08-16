package com.quitter.app

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Intent
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
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

                        result.success(manager.requestPinAppWidget(provider, null, null))
                    }

                    "hasWidgetSelection" -> {
                        val expectedSelection = call.argument<String>("selection")
                        val widgetPreferences =
                            getSharedPreferences("QuitTrackerWidget", MODE_PRIVATE)
                        val hasSelection = manager.getAppWidgetIds(provider).any {
                            widgetPreferences.getString("selected_$it", null) == expectedSelection
                        }
                        result.success(hasSelection)
                    }

                    "openUnconfiguredWidget" -> {
                        val widgetPreferences =
                            getSharedPreferences("QuitTrackerWidget", MODE_PRIVATE)
                        val appWidgetId = manager.getAppWidgetIds(provider).lastOrNull {
                            !widgetPreferences.contains("selected_$it")
                        }
                        if (appWidgetId == null) {
                            result.success(false)
                            return@setMethodCallHandler
                        }

                        val intent = Intent(this, WidgetSelectionActivity::class.java).apply {
                            putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
                        }
                        startActivity(intent)
                        result.success(true)
                    }

                    else -> result.notImplemented()
                }
            }
    }
}
