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
import java.util.concurrent.Executors
import java.util.concurrent.RejectedExecutionException

class QuitTrackerWidget : AppWidgetProvider() {

    companion object {
        private const val TAG = "QuitTrackerWidget"
        private val updateExecutor = Executors.newFixedThreadPool(2)


        private fun daysCeil(isoDateString: String): Int {
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
                baseContext: Context,
                appWidgetManager: AppWidgetManager,
                appWidgetId: Int
        ) {

            val context = baseContext.withQuitterLocale()
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
                                            R.drawable.ic_widget_local_bar
                                    ),
                            "vaping" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_vaping),
                                            R.drawable.ic_widget_air
                                    ),
                            "smoking" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_smoking),
                                            R.drawable.ic_widget_eco
                                    ),
                            "smokeless_tobacco" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_smokeless_tobacco),
                                            R.drawable.ic_widget_grass
                                    ),
                            "marijuana" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_marijuana),
                                            R.drawable.ic_widget_grass
                                    ),
                            "nicotine_pouches" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_nicotine_pouches),
                                            R.drawable.ic_widget_scatter_plot
                                    ),
                            "opioids" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_opioids),
                                            R.drawable.ic_widget_medication
                                    ),
                            "heroin" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_heroin),
                                            R.drawable.ic_widget_medication
                                    ),
                            "fentanyl" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_fentanyl),
                                            R.drawable.ic_widget_medication
                                    ),
                            "social_media" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_social_media),
                                            R.drawable.ic_widget_public
                                    ),
                            "pornography" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_pornography),
                                            R.drawable.ic_widget_block
                                    ),
                            "cocaine" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_cocaine),
                                            R.drawable.ic_widget_bolt
                                    ),
                            "meth" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_meth),
                                            R.drawable.ic_widget_battery_charging_full
                                    ),
                            "benzos" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_benzos),
                                            R.drawable.ic_widget_bedtime
                                    ),
                            "adderall" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_adderall),
                                            R.drawable.ic_widget_lightbulb_outline
                                    ),
                            "ssri" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_ssri),
                                            R.drawable.ic_widget_psychology
                                    ),
                            "snri" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_snri),
                                            R.drawable.ic_widget_psychology_alt
                                    ),
                            "tca" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_tca),
                                            R.drawable.ic_widget_medication_liquid
                                    ),
                            "maoi" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_maoi),
                                            R.drawable.ic_widget_science
                                    ),
                            "nitrous_oxide" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_nitrous_oxide),
                                            R.drawable.ic_widget_air
                                    ),
                            "kratom" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_kratom),
                                            R.drawable.ic_widget_local_florist
                                    ),
                            "gabapentinoids" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_gabapentinoids),
                                            R.drawable.ic_widget_medication_outlined
                                    ),
                            "ghb" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_ghb),
                                            R.drawable.ic_widget_water_drop
                                    ),
                            "ketamine" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_ketamine),
                                            R.drawable.ic_widget_vaccines
                                    ),
                            "inhalants" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_inhalants),
                                            R.drawable.ic_widget_local_gas_station
                                    ),
                            "synthetic_cannabinoids" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_synthetic_cannabinoids),
                                            R.drawable.ic_widget_whatshot
                                    ),
                            "mdma" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_mdma),
                                            R.drawable.ic_widget_favorite
                                    ),
                            "steroids" to
                                    AddictionInfo(
                                            context.getString(R.string.addiction_steroids),
                                            R.drawable.ic_widget_fitness_center
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
                views = RemoteViews(context.packageName, R.layout.quit_tracker_widget_selector)
                views.setTextViewText(
                        R.id.widget_setup_text,
                        context.getString(R.string.widget_setup_text)
                )
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
                        val widgetText =
                                context.resources.getQuantityString(
                                        R.plurals.widget_days,
                                        days,
                                        days
                                )
                        views.setTextViewText(R.id.widget_title, title)
                        views.setTextViewText(R.id.widget_days, widgetText)
                        views.setImageViewResource(R.id.widget_icon, R.drawable.ic_widget_star)
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
                views.setOnClickPendingIntent(R.id.widget_container, pendingSelect)
                return appWidgetManager.updateAppWidget(appWidgetId, views)
            }

            var days = daysCeil(quitDate)
            if (days == 0) days = 1
            val widgetText =
                    context.resources.getQuantityString(
                            R.plurals.widget_days,
                            days,
                            days
                    )
            views.setTextViewText(R.id.widget_days, widgetText)
            views.setOnClickPendingIntent(R.id.widget_container, mainPendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }

    override fun onUpdate(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetIds: IntArray
    ) {
        // Broadcasts share Android's main thread; offload RemoteViews preparation.
        // https://developer.android.com/develop/ui/views/appwidgets/advanced#broadcast-receiver
        val pendingResult = goAsync()
        try {
            updateExecutor.execute {
                try {
                    QuitTrackerWidgetWorker.schedule(context.applicationContext)
                    for (appWidgetId in appWidgetIds) {
                        try {
                            updateAppWidget(context.applicationContext, appWidgetManager, appWidgetId)
                        } catch (error: Exception) {
                            Log.e(TAG, "Failed to update widget $appWidgetId", error)
                        }
                    }
                } finally {
                    pendingResult.finish()
                }
            }
        } catch (error: RejectedExecutionException) {
            pendingResult.finish()
            Log.e(TAG, "Unable to schedule widget update", error)
        }
    }

    override fun onDisabled(context: Context) {
        super.onDisabled(context)
        QuitTrackerWidgetWorker.cancel(context.applicationContext)
    }

    data class AddictionInfo(
            val title: String,
            val iconRes: Int
    )
}
