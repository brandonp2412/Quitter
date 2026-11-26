package com.quitter.app

import android.app.AlarmManager
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.work.ExistingWorkPolicy
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.Worker
import androidx.work.WorkerParameters
import com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver
import org.json.JSONArray
import org.json.JSONObject
import java.time.LocalDateTime
import java.time.ZoneId
import java.util.concurrent.Executors

internal object ReminderScheduler {
    private const val tag = "ReminderScheduler"
    private const val preferences = "native_reminders"
    private const val queueKey = "queue"
    private const val channelId = "reminders_channel_id"
    private const val legacyPreferences = "scheduled_notifications"
    private const val refreshWork = "quitter_native_reminder_refresh"
    private const val alarmRequestCode = 7341
    internal const val actionAlarm = "com.quitter.app.NATIVE_REMINDER"
    internal val executor = Executors.newSingleThreadExecutor()

    private data class Reminder(
        val id: Int,
        val at: Long,
        val title: String,
        val body: String
    ) {
        fun json() = JSONObject().put("id", id).put("at", at)
            .put("title", title).put("body", body)

        companion object {
            fun parse(json: JSONObject) = Reminder(
                json.getInt("id"), json.getLong("at"),
                json.getString("title"), json.getString("body")
            )
        }
    }

    private fun prefs(context: Context) =
        context.getSharedPreferences(preferences, Context.MODE_PRIVATE)

    private fun readQueue(context: Context): List<Reminder> {
        val records = JSONArray(prefs(context).getString(queueKey, "[]"))
        return (0 until records.length()).map { Reminder.parse(records.getJSONObject(it)) }
    }

    private fun persist(
        context: Context,
        reminders: List<Reminder>,
        channelName: String? = null,
        channelDescription: String? = null
    ) {
        val queue = JSONArray()
        reminders.sortedBy { it.at }.forEach { queue.put(it.json()) }
        val editor = prefs(context).edit().putString(queueKey, queue.toString())
        if (channelName != null) editor.putString("channelName", channelName)
        if (channelDescription != null) editor.putString("channelDescription", channelDescription)
        check(editor.commit()) { "Unable to persist reminder queue" }
    }

    private fun legacyRecords(context: Context): JSONArray {
        val stored = context.getSharedPreferences(legacyPreferences, Context.MODE_PRIVATE)
            .getString(legacyPreferences, "[]")
        return try {
            JSONArray(stored)
        } catch (error: Exception) {
            Log.e(tag, "Unable to decode legacy reminders", error)
            JSONArray()
        }
    }

    private fun cancelLegacyAlarms(context: Context, records: JSONArray) {
        val manager = context.getSystemService(AlarmManager::class.java)
        val intent = Intent(context, ScheduledNotificationReceiver::class.java)
        for (index in 0 until records.length()) {
            val item = records.optJSONObject(index) ?: continue
            val id = item.optInt("id", Int.MIN_VALUE)
            if (id == Int.MIN_VALUE) continue
            val pending = PendingIntent.getBroadcast(
                context, id, intent,
                PendingIntent.FLAG_NO_CREATE or PendingIntent.FLAG_IMMUTABLE
            ) ?: continue
            manager.cancel(pending)
            pending.cancel()
        }
        check(context.getSharedPreferences(legacyPreferences, Context.MODE_PRIVATE)
            .edit().remove(legacyPreferences).commit()) { "Unable to clear legacy reminders" }
    }

    private fun migrate(context: Context) {
        val records = legacyRecords(context)
        if (!prefs(context).contains(queueKey)) {
            val migrated = mutableListOf<Reminder>()
            var name: String? = null
            var description: String? = null
            for (index in 0 until records.length()) {
                val item = records.optJSONObject(index) ?: continue
                try {
                    val at = if (item.has("scheduledDateTime")) {
                        LocalDateTime.parse(item.getString("scheduledDateTime"))
                            .atZone(ZoneId.of(item.getString("timeZoneName")))
                            .toInstant().toEpochMilli()
                    } else {
                        item.getLong("millisecondsSinceEpoch")
                    }
                    migrated.add(Reminder(item.getInt("id"), at,
                        item.optString("title"), item.optString("body")))
                    name = item.optString("channelName", "Reminders")
                    description = item.optString("channelDescription")
                } catch (error: Exception) {
                    Log.w(tag, "Skipping invalid legacy reminder", error)
                }
            }
            persist(context, migrated, name, description)
        }
        if (records.length() > 0) cancelLegacyAlarms(context, records)
    }

    internal fun cancelLegacyWorkers(context: Context) {
        val work = WorkManager.getInstance(context)
        listOf("reminders", "reminder_oneoff", "widgets", "widget_oneoff").forEach {
            work.cancelUniqueWork(it)
        }
    }

    private fun alarm(context: Context): PendingIntent =
        PendingIntent.getBroadcast(
            context, alarmRequestCode,
            Intent(context, ReminderReceiver::class.java).setAction(actionAlarm),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

    private fun scheduleNext(context: Context, next: Reminder?) {
        val manager = context.getSystemService(AlarmManager::class.java)
        val pending = alarm(context)
        if (next == null) {
            manager.cancel(pending)
        } else {
            manager.setAndAllowWhileIdle(
                AlarmManager.RTC_WAKEUP, maxOf(System.currentTimeMillis(), next.at), pending
            )
        }
    }

    private fun deliver(context: Context, reminder: Reminder) {
        val manager = NotificationManagerCompat.from(context)
        if (!manager.areNotificationsEnabled()) return
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val settings = prefs(context)
            context.getSystemService(NotificationManager::class.java).createNotificationChannel(
                NotificationChannel(
                    channelId, settings.getString("channelName", "Reminders"),
                    NotificationManager.IMPORTANCE_HIGH
                ).apply {
                    description = settings.getString("channelDescription", "")
                }
            )
        }
        val launch = context.packageManager.getLaunchIntentForPackage(context.packageName)
            ?: return
        val open = PendingIntent.getActivity(
            context, reminder.id, launch,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        val notification = NotificationCompat.Builder(context, channelId)
            .setSmallIcon(R.drawable.neurology)
            .setContentTitle(reminder.title)
            .setContentText(reminder.body)
            .setAutoCancel(true)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setContentIntent(open)
            .build()
        try {
            manager.notify(reminder.id, notification)
        } catch (error: SecurityException) {
            Log.w(tag, "Notification permission unavailable", error)
        }
    }

    @Synchronized
    internal fun refresh(context: Context, maxDeliveries: Int = Int.MAX_VALUE) {
        migrate(context)
        val queue = readQueue(context).sortedBy { it.at }
        val now = System.currentTimeMillis()
        val due = queue.takeWhile { it.at <= now }.take(maxDeliveries)
        val future = queue.drop(due.size)
        due.forEach { deliver(context, it) }
        if (due.isNotEmpty()) persist(context, future)
        scheduleNext(context, future.firstOrNull())
        Log.i(tag, "Reminder queue: ${future.size} pending, ${due.size} delivered")
    }

    @Synchronized
    internal fun replace(
        context: Context,
        records: List<Map<String, Any?>>,
        channelName: String,
        channelDescription: String
    ) {
        val reminders = records.map {
            Reminder(
                (it.getValue("id") as Number).toInt(),
                (it.getValue("at") as Number).toLong(),
                it.getValue("title") as String,
                it.getValue("body") as String
            )
        }
        persist(context, reminders, channelName, channelDescription)
        migrate(context)
        try {
            scheduleNext(context, reminders.minByOrNull { it.at })
        } catch (error: RuntimeException) {
            Log.e(tag, "Alarm scheduling failed; retaining queue for retry", error)
            requestRefresh(context)
        }
    }

    internal fun requestRefresh(context: Context) =
        WorkManager.getInstance(context).enqueueUniqueWork(
            refreshWork, ExistingWorkPolicy.REPLACE,
            OneTimeWorkRequestBuilder<ReminderRefreshWorker>().build()
        )
}

class ReminderRefreshWorker(context: Context, parameters: WorkerParameters) :
    Worker(context, parameters) {
    override fun doWork(): Result = try {
        ReminderScheduler.cancelLegacyWorkers(applicationContext)
        ReminderScheduler.refresh(applicationContext)
        Result.success()
    } catch (error: Exception) {
        Log.e("ReminderScheduler", "Unable to refresh reminder queue", error)
        Result.retry()
    }
}

class ReminderReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val application = context.applicationContext
        val pending = goAsync()
        val isAlarm = intent.action == ReminderScheduler.actionAlarm
        ReminderScheduler.executor.execute {
            try {
                if (isAlarm) {
                    try {
                        ReminderScheduler.refresh(application, maxDeliveries = 20)
                    } catch (error: Exception) {
                        Log.e("ReminderScheduler", "Unable to deliver reminders; retrying", error)
                        ReminderScheduler.requestRefresh(application).result.get()
                    }
                } else {
                    ReminderScheduler.requestRefresh(application).result.get()
                }
            } catch (error: Exception) {
                Log.e("ReminderScheduler", "Unable to enqueue reminder refresh", error)
            } finally {
                pending.finish()
            }
        }
    }
}
