package com.quitter.app

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.util.Log
import android.widget.RemoteViews
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import org.json.JSONArray
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.temporal.ChronoUnit

class QuitTrackerWidget : AppWidgetProvider() {

    companion object {
        private const val TAG = "QuitTrackerWidget"

        private fun daysCeil(isoDateString: String?): Int {
            if (isoDateString == null) return 0
            val quitDate =
                    if (isoDateString.contains('T')) {
                        LocalDateTime.parse(isoDateString).toLocalDate()
                    } else {
                        LocalDate.parse(isoDateString)
                    }
            val today = LocalDate.now()
            val daysBetween = ChronoUnit.DAYS.between(quitDate, today)
            return (daysBetween + 1).toInt()
        }

        private fun getSecurePreferences(context: Context): android.content.SharedPreferences {
            val masterKey = MasterKey.Builder(context)
                    .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
                    .build()

            return EncryptedSharedPreferences.create(
                    context,
                    "FlutterSecureStorage",
                    masterKey,
                    EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
                    EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
            )
        }

        fun updateAppWidget(
                context: Context,
                appWidgetManager: AppWidgetManager,
                appWidgetId: Int
        ) {
            Log.d(TAG, "Updating widget $appWidgetId")

            val prefs = getSecurePreferences(context)
            val widgetPrefs =
                    context.getSharedPreferences("QuitTrackerWidget", Context.MODE_PRIVATE)
            val selectedAddiction = widgetPrefs.getString("selected_$appWidgetId", null)

            val addictionData =
                    mapOf(
                            "alcohol" to
                                    AddictionInfo(
                                            "Alcohol",
                                            R.drawable.ic_local_bar,
                                            0xFF6366F1,
                                            0xFF8B5CF6
                                    ),
                            "vaping" to
                                    AddictionInfo(
                                            "Vaping",
                                            R.drawable.ic_air,
                                            0xFF06B6D4,
                                            0xFF0EA5E9
                                    ),
                            "smoking" to
                                    AddictionInfo(
                                            "Smoking",
                                            R.drawable.ic_eco,
                                            0xFF10B981,
                                            0xFF059669
                                    ),
                            "marijuana" to
                                    AddictionInfo(
                                            "Marijuana",
                                            R.drawable.ic_grass,
                                            0xFF84E680,
                                            0xFF1E5703
                                    ),
                            "nicotine_pouches" to
                                    AddictionInfo(
                                            "Nicotine Pouches",
                                            R.drawable.ic_scatter_plot,
                                            0xFFF59E0B,
                                            0xFFEF4444
                                    ),
                            "opioids" to
                                    AddictionInfo(
                                            "Opioids",
                                            R.drawable.ic_medication,
                                            0xFFEC4899,
                                            0xFFBE185D
                                    ),
                            "social_media" to
                                    AddictionInfo(
                                            "Social Media",
                                            R.drawable.ic_public,
                                            0xFF8B5CF6,
                                            0xFF7C3AED
                                    ),
                            "pornography" to
                                    AddictionInfo(
                                            "Adult content",
                                            R.drawable.ic_block,
                                            0xFFF43F5E,
                                            0xFFE11D48
                                    )
                    )

            val views: RemoteViews
            val selectIntent = Intent(context, WidgetSelectionActivity::class.java)
            selectIntent.putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
            val pendingSelect =
                    PendingIntent.getActivity(
                            context,
                            appWidgetId,
                            selectIntent,
                            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                    )

            if (selectedAddiction == null) {
                Log.d(TAG, "No addiction selected for widget $appWidgetId")
                views = RemoteViews(context.packageName, R.layout.quit_tracker_widget_selector)
                views.setOnClickPendingIntent(R.id.widget_container, pendingSelect)
                return appWidgetManager.updateAppWidget(appWidgetId, views)
            }

            views = RemoteViews(context.packageName, R.layout.quit_tracker_widget)
            val addictionInfo = addictionData[selectedAddiction]
            var quitDate = prefs.getString(selectedAddiction, null)
            val mainIntent = Intent(context, MainActivity::class.java)
            val mainPendingIntent =
                    PendingIntent.getActivity(
                            context,
                            appWidgetId,
                            mainIntent,
                            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                    )

            if (addictionInfo == null) {
                Log.d(TAG, "Addiction info not found, checking entries for $selectedAddiction")
                val entriesJson = prefs.getString("entries", null)
                if (entriesJson == null) {
                    Log.w(TAG, "No entries found in secure storage")
                    views.setTextViewText(R.id.widget_title, "Unknown")
                    views.setTextViewText(R.id.widget_days, "Error")
                } else {
                    val jsonArray = JSONArray(entriesJson)
                    for (i in 0 until jsonArray.length()) {
                        val entryObject = jsonArray.getJSONObject(i)
                        val id = entryObject.getString("id")
                        if (selectedAddiction != id) continue
                        val title = entryObject.getString("title")
                        quitDate = entryObject.getString("quitDate")
                        val days = daysCeil(quitDate)
                        val widgetText = "$days ${if (days == 1) "day" else "days"}"
                        Log.d(TAG, "Updated widget with custom entry: $title, $days days")
                        views.setTextViewText(R.id.widget_title, title)
                        views.setTextViewText(R.id.widget_days, widgetText)
                        views.setImageViewResource(R.id.widget_icon, R.drawable.star)
                        views.setOnClickPendingIntent(R.id.widget_container, mainPendingIntent)
                    }
                }

                return appWidgetManager.updateAppWidget(appWidgetId, views)
            }

            views.setTextViewText(R.id.widget_title, addictionInfo.title)
            views.setImageViewResource(R.id.widget_icon, addictionInfo.iconRes)

            if (quitDate == null) {
                Log.w(TAG, "No quit date found for key: $selectedAddiction")
                views.setTextViewText(R.id.widget_days, "Not set")
                val allKeys = prefs.all.keys
                Log.d(TAG, "Available secure storage keys: ${allKeys.joinToString(", ")}")
                views.setOnClickPendingIntent(R.id.widget_container, pendingSelect)
                return appWidgetManager.updateAppWidget(appWidgetId, views)
            }

            Log.d(TAG, "Found quit date for $selectedAddiction: $quitDate")
            var days = daysCeil(quitDate)
            if (days == 0) days = 1
            val widgetText = "$days ${if (days == 1) "day" else "days"}"
            Log.d(TAG, "Calculated days: $days for quit date: $quitDate")
            views.setTextViewText(R.id.widget_days, widgetText)
            views.setOnClickPendingIntent(R.id.widget_container, mainPendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
            Log.d(TAG, "Widget $appWidgetId update complete")
        }
    }

    override fun onUpdate(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetIds: IntArray
    ) {
        Log.d(TAG, "onUpdate called with ${appWidgetIds.size} widgets")
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    data class AddictionInfo(
            val title: String,
            val iconRes: Int,
            val primaryColor: Long,
            val secondaryColor: Long
    )
}