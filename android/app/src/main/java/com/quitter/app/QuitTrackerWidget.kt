package com.quitter.app

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.util.Log
import android.widget.RemoteViews
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

        fun updateAppWidget(
                context: Context,
                appWidgetManager: AppWidgetManager,
                appWidgetId: Int
        ) {
            Log.d(TAG, "Updating widget $appWidgetId")

            val prefs =
                    context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            val widgetPrefs =
                    context.getSharedPreferences("QuitTrackerWidget", Context.MODE_PRIVATE)
            val selectedAddiction = widgetPrefs.getString("selected_$appWidgetId", null)

            val addictionData =
                    mapOf(
                            "alcohol" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_alcohol),
                                            R.drawable.ic_local_bar,
                                            0xFF6366F1,
                                            0xFF8B5CF6
                                    ),
                            "vaping" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_vaping),
                                            R.drawable.ic_air,
                                            0xFF06B6D4,
                                            0xFF0EA5E9
                                    ),
                            "smoking" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_smoking),
                                            R.drawable.ic_eco,
                                            0xFF10B981,
                                            0xFF059669
                                    ),
                            "marijuana" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_marijuana),
                                            R.drawable.ic_grass,
                                            0xFF84E680,
                                            0xFF1E5703
                                    ),
                            "nicotine_pouches" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_nicotine_pouches),
                                            R.drawable.ic_scatter_plot,
                                            0xFFF59E0B,
                                            0xFFEF4444
                                    ),
                            "opioids" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_opioids),
                                            R.drawable.ic_medication,
                                            0xFFEC4899,
                                            0xFFBE185D
                                    ),
                            "social_media" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_social_media),
                                            R.drawable.ic_public,
                                            0xFF8B5CF6,
                                            0xFF7C3AED
                                    ),
                            "pornography" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_pornography),
                                            R.drawable.ic_block,
                                            0xFFF43F5E,
                                            0xFFE11D48
                                    ),
                            "cocaine" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_cocaine),
                                            R.drawable.ic_medication,
                                            0xFF3B82F6,
                                            0xFF1D4ED8
                                    ),
                            "meth" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_meth),
                                            R.drawable.ic_medication,
                                            0xFF14B8A6,
                                            0xFF0D9488
                                    ),
                            "benzos" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_benzos),
                                            R.drawable.ic_medication,
                                            0xFF6D5DD3,
                                            0xFF1E1B4B
                                    ),
                            "adderall" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_adderall),
                                            R.drawable.ic_medication,
                                            0xFFFF8C42,
                                            0xFFFF6B35
                                    ),
                            "ssri" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_ssri),
                                            R.drawable.ic_medication,
                                            0xFF7C3AED,
                                            0xFF4F46E5
                                    ),
                            "snri" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_snri),
                                            R.drawable.ic_medication,
                                            0xFF6D28D9,
                                            0xFF7C3AED
                                    ),
                            "tca" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_tca),
                                            R.drawable.ic_medication,
                                            0xFF5B21B6,
                                            0xFF6D28D9
                                    ),
                            "maoi" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_maoi),
                                            R.drawable.ic_medication,
                                            0xFF4C1D95,
                                            0xFF5B21B6
                                    ),
                            "nitrous_oxide" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_nitrous_oxide),
                                            R.drawable.ic_air,
                                            0xFF38BDF8,
                                            0xFF7DD3FC
                                    ),
                            "kratom" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_kratom),
                                            R.drawable.ic_medication,
                                            0xFF6D9F4E,
                                            0xFF3F6B2E
                                    ),
                            "gabapentinoids" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_gabapentinoids),
                                            R.drawable.ic_medication,
                                            0xFF94A3B8,
                                            0xFF475569
                                    ),
                            "ghb" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_ghb),
                                            R.drawable.ic_medication,
                                            0xFF60A5FA,
                                            0xFF1E3A8A
                                    ),
                            "ketamine" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_ketamine),
                                            R.drawable.ic_medication,
                                            0xFF818CF8,
                                            0xFF4338CA
                                    ),
                            "inhalants" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_inhalants),
                                            R.drawable.ic_medication,
                                            0xFF9CA3AF,
                                            0xFF4B5563
                                    ),
                            "synthetic_cannabinoids" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_synthetic_cannabinoids),
                                            R.drawable.ic_medication,
                                            0xFFA3E635,
                                            0xFF4D7C0F
                                    ),
                            "mdma" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_mdma),
                                            R.drawable.ic_medication,
                                            0xFFF472B6,
                                            0xFFA855F7
                                    ),
                            "steroids" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_steroids),
                                            R.drawable.ic_medication,
                                            0xFFEF4444,
                                            0xFF7F1D1D
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
            var quitDate = prefs.getString("flutter.$selectedAddiction", null)
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
                val entriesJson = prefs.getString("flutter.entries", null)
                if (entriesJson == null) {
                    Log.w(TAG, "No entries found in SharedPreferences")
                    views.setTextViewText(R.id.widget_title, context.getString(R.string.widget_unknown))
                    views.setTextViewText(R.id.widget_days, context.getString(R.string.widget_error))
                } else {
                    val jsonArray = JSONArray(entriesJson)
                    for (i in 0 until jsonArray.length()) {
                        val entryObject = jsonArray.getJSONObject(i)
                        val id = entryObject.getString("id")
                        if (selectedAddiction != id) continue
                        val title = entryObject.getString("title")
                        quitDate = entryObject.getString("quitDate")
                        val days = daysCeil(quitDate)
                        val daysText = if (days == 1) context.getString(R.string.widget_day_singular) else context.getString(R.string.widget_day_plural)
                        val widgetText = "$days $daysText"
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
                Log.w(TAG, "No quit date found for key: flutter.$selectedAddiction")
                views.setTextViewText(R.id.widget_days, context.getString(R.string.widget_not_set))
                val allKeys = prefs.all.keys
                Log.d(TAG, "Available SharedPreferences keys: ${allKeys.joinToString(", ")}")
                views.setOnClickPendingIntent(R.id.widget_container, pendingSelect)
                return appWidgetManager.updateAppWidget(appWidgetId, views)
            }

            Log.d(TAG, "Found quit date for $selectedAddiction: $quitDate")
            var days = daysCeil(quitDate)
            if (days == 0) days = 1
            val daysText = if (days == 1) context.getString(R.string.widget_day_singular) else context.getString(R.string.widget_day_plural)
            val widgetText = "$days $daysText"
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
