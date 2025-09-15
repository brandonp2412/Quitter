package com.quitter.app

import android.app.AlarmManager
import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.temporal.ChronoUnit
import java.util.Calendar

/**
 * Implementation of App Widget functionality.
 */
class QuitTrackerWidget : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    private fun scheduleDailyUpdate(context: Context) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(context, QuitTrackerWidget::class.java).apply {
            action = AppWidgetManager.ACTION_APPWIDGET_UPDATE
        }
        val pendingIntent = PendingIntent.getBroadcast(
            context,
            0,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val calendar = Calendar.getInstance().apply {
            add(Calendar.DAY_OF_YEAR, 1)
            set(Calendar.HOUR_OF_DAY, 0)
            set(Calendar.MINUTE, 0)
            set(Calendar.SECOND, 0)
            set(Calendar.MILLISECOND, 0)
        }

        alarmManager.setRepeating(
            AlarmManager.RTC_WAKEUP,
            calendar.timeInMillis,
            AlarmManager.INTERVAL_DAY,
            pendingIntent
        )
    }

    override fun onEnabled(context: Context?) {
        if (context != null) scheduleDailyUpdate(context)
    }

    private fun cancelDailyUpdate(context: Context) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(context, QuitTrackerWidget::class.java)
        val pendingIntent = PendingIntent.getBroadcast(
            context,
            0,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        alarmManager.cancel(pendingIntent)
    }

    override fun onDisabled(context: Context?) {
        if (context != null) cancelDailyUpdate(context)
    }

    companion object {
        private fun daysCeil(isoDateString: String?): Int {
            if (isoDateString == null) return 0
            val quitDate = if (isoDateString.contains('T')) {
                LocalDateTime.parse(isoDateString).toLocalDate()
            } else {
                LocalDate.parse(isoDateString)
            }
            val today = LocalDate.now()
            val daysBetween = ChronoUnit.DAYS.between(quitDate, today)
            return (daysBetween + 1).toInt()
        }

        fun updateAppWidget(
            context: Context, appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            val widgetPrefs = context.getSharedPreferences("QuitTrackerWidget", Context.MODE_PRIVATE)
            val selectedAddiction = widgetPrefs.getString("selected_$appWidgetId", null)

            val addictionData = mapOf(
                "alcohol" to AddictionInfo(
                    "Alcohol",
                    R.drawable.ic_local_bar,
                    0xFF6366F1, // Primary gradient color from Flutter
                    0xFF8B5CF6  // Secondary gradient color
                ),
                "vaping" to AddictionInfo(
                    "Vaping",
                    R.drawable.ic_air,
                    0xFF06B6D4,
                    0xFF0EA5E9
                ),
                "smoking" to AddictionInfo(
                    "Smoking",
                    R.drawable.ic_eco,
                    0xFF10B981,
                    0xFF059669
                ),
                "marijuana" to AddictionInfo(
                    "Marijuana",
                    R.drawable.ic_grass,
                    0xFF84E680, // From your Flutter colors
                    0xFF1E5703
                ),
                "nicotine_pouches" to AddictionInfo(
                    "Nicotine Pouches",
                    R.drawable.ic_scatter_plot,
                    0xFFF59E0B,
                    0xFFEF4444
                ),
                "opioids" to AddictionInfo(
                    "Opioids",
                    R.drawable.ic_medication,
                    0xFFEC4899,
                    0xFFBE185D
                ),
                "social_media" to AddictionInfo(
                    "Social Media",
                    R.drawable.ic_public,
                    0xFF8B5CF6,
                    0xFF7C3AED
                ),
                "pornography" to AddictionInfo(
                    "Pornography",
                    R.drawable.ic_block,
                    0xFFF43F5E,
                    0xFFE11D48
                )
            )

            val views: RemoteViews

            if (selectedAddiction == null) {
                views = RemoteViews(context.packageName, R.layout.quit_tracker_widget_selector)
                val intent = Intent(context, WidgetSelectionActivity::class.java)
                intent.putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
                val pendingIntent = PendingIntent.getActivity(
                    context,
                    appWidgetId,
                    intent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )
                views.setOnClickPendingIntent(R.id.widget_container, pendingIntent)
                return appWidgetManager.updateAppWidget(appWidgetId, views)
            }

            views = RemoteViews(context.packageName, R.layout.quit_tracker_widget)
            val addictionInfo = addictionData[selectedAddiction]
            val quitDate = prefs.getString("flutter.$selectedAddiction", null)

            if (addictionInfo == null) {
                views.setTextViewText(R.id.widget_title, "Unknown")
                views.setTextViewText(R.id.widget_days, "Error")
                return appWidgetManager.updateAppWidget(appWidgetId, views)
            }

            views.setTextViewText(R.id.widget_title, addictionInfo.title)
            views.setImageViewResource(R.id.widget_icon, addictionInfo.iconRes)

            if (quitDate == null) {
                android.util.Log.d("QuitTrackerWidget", "No quit date found for key: flutter.$selectedAddiction")
                views.setTextViewText(R.id.widget_days, "Not set")
                val allKeys = prefs.all.keys
                android.util.Log.d("QuitTrackerWidget", "Available SharedPreferences keys: ${allKeys.joinToString(", ")}")

                val selectIntent = Intent(context, WidgetSelectionActivity::class.java)
                selectIntent.putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
                val selectPendingIntent = PendingIntent.getActivity(
                    context,
                    appWidgetId + 10000,
                    selectIntent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )
                views.setOnClickPendingIntent(R.id.widget_container, selectPendingIntent)
                return appWidgetManager.updateAppWidget(appWidgetId, views)
            }

            android.util.Log.d("QuitTrackerWidget", "Found quit date for $selectedAddiction: $quitDate")
            var days = daysCeil(quitDate)
            if (days == 0) days = 1
            val widgetText = "$days ${if (days == 1) "day" else "days"}"
            views.setTextViewText(R.id.widget_days, widgetText)

            val mainIntent = Intent(context, MainActivity::class.java)
            val mainPendingIntent = PendingIntent.getActivity(
                context,
                appWidgetId,
                mainIntent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_container, mainPendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }

    data class AddictionInfo(
        val title: String,
        val iconRes: Int,
        val primaryColor: Long,
        val secondaryColor: Long
    )
}