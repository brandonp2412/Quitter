package com.quitter.app

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.util.Log
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.Worker
import androidx.work.WorkerParameters
import androidx.work.WorkManager
import java.time.Duration
import java.time.LocalDateTime
import java.util.concurrent.TimeUnit

/**
 * Updates home-screen counters without starting Flutter's Dart engine in the background.
 *
 * WorkManager jobs run approximately, not exactly, at local midnight.
 * https://developer.android.com/develop/ui/views/appwidgets/advanced
 */
class QuitTrackerWidgetWorker(
    appContext: Context,
    workerParameters: WorkerParameters
) : Worker(appContext, workerParameters) {
    override fun doWork(): Result {
        val manager = AppWidgetManager.getInstance(applicationContext)
        val provider = ComponentName(applicationContext, QuitTrackerWidget::class.java)
        val ids = manager.getAppWidgetIds(provider)
        var failed = false
        for (id in ids) {
            try {
                QuitTrackerWidget.updateAppWidget(applicationContext, manager, id)
            } catch (error: Exception) {
                Log.e(TAG, "Failed to refresh widget $id", error)
                failed = true
            }
        }
        return if (failed) Result.retry() else Result.success()
    }

    companion object {
        private const val TAG = "QuitTrackerWidgetWorker"
        private const val WORK_NAME = "quit_tracker_widget_daily"

        fun schedule(context: Context) {
            val manager = AppWidgetManager.getInstance(context)
            val provider = ComponentName(context, QuitTrackerWidget::class.java)
            if (manager.getAppWidgetIds(provider).isEmpty()) {
                cancel(context)
                return
            }
            val midnight = LocalDateTime.now().toLocalDate().plusDays(1).atStartOfDay()
            val initialDelay = Duration.between(LocalDateTime.now(), midnight).toMillis()
            val request = PeriodicWorkRequestBuilder<QuitTrackerWidgetWorker>(
                1, TimeUnit.DAYS
            ).setInitialDelay(initialDelay, TimeUnit.MILLISECONDS).build()

            WorkManager.getInstance(context).enqueueUniquePeriodicWork(
                WORK_NAME, ExistingPeriodicWorkPolicy.KEEP, request
            )
        }

        fun cancel(context: Context) {
            WorkManager.getInstance(context).cancelUniqueWork(WORK_NAME)
        }
    }
}
