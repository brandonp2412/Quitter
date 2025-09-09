package com.quitter.app;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.widget.RemoteViews;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

public class QuitTrackerWidgetProvider extends AppWidgetProvider {

    private static final String[] ADDICTION_KEYS = {
            "pornography", "smoking", "opioids", "alcohol",
            "social_media", "vaping", "nicotine_pouches"
    };

    private static final String[] ADDICTION_NAMES = {
            "Pornography", "Smoking", "Opioids", "Alcohol",
            "Social Media", "Vaping", "Nicotine Pouches"
    };

    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        for (int appWidgetId : appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId);
        }
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        super.onReceive(context, intent);

        if ("android.appwidget.action.APPWIDGET_UPDATE".equals(intent.getAction()) ||
                "com.yourpackage.yourapp.UPDATE_WIDGET".equals(intent.getAction())) {

            AppWidgetManager appWidgetManager = AppWidgetManager.getInstance(context);
            ComponentName componentName = new ComponentName(context, QuitTrackerWidgetProvider.class);
            int[] appWidgetIds = appWidgetManager.getAppWidgetIds(componentName);
            onUpdate(context, appWidgetManager, appWidgetIds);
        }
    }

    static void updateAppWidget(Context context, AppWidgetManager appWidgetManager, int appWidgetId) {
        RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.quit_tracker_widget);

        // Get SharedPreferences (Flutter uses specific preferences)
        SharedPreferences prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);

        StringBuilder widgetText = new StringBuilder();
        boolean hasData = false;

        for (int i = 0; i < ADDICTION_KEYS.length; i++) {
            String key = "flutter." + ADDICTION_KEYS[i];
            String dateString = prefs.getString(key, null);

            if (dateString != null && !dateString.isEmpty()) {
                hasData = true;
                try {
                    // Parse ISO date string
                    SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.getDefault());
                    Date quitDate = isoFormat.parse(dateString);

                    if (quitDate != null) {
                        long daysSince = calculateDaysSince(quitDate);
                        widgetText.append(ADDICTION_NAMES[i])
                                .append(": ")
                                .append(daysSince)
                                .append(daysSince == 1 ? " day" : " days")
                                .append("\n");
                    }
                } catch (Exception e) {
                    // Try alternative date format
                    try {
                        SimpleDateFormat altFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS", Locale.getDefault());
                        Date quitDate = altFormat.parse(dateString);
                        if (quitDate != null) {
                            long daysSince = calculateDaysSince(quitDate);
                            widgetText.append(ADDICTION_NAMES[i])
                                    .append(": ")
                                    .append(daysSince)
                                    .append(daysSince == 1 ? " day" : " days")
                                    .append("\n");
                        }
                    } catch (Exception ex) {
                        // Skip this entry if we can't parse the date
                    }
                }
            }
        }

        if (!hasData) {
            widgetText.append("No quit dates set.\nOpen the app to start tracking!");
        }

        views.setTextViewText(R.id.widget_text, widgetText.toString().trim());

        // Add click intent to open the app
        Intent intent = new Intent(context, MainActivity.class);
        PendingIntent pendingIntent = PendingIntent.getActivity(
                context, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        views.setOnClickPendingIntent(R.id.widget_container, pendingIntent);

        // Update last updated time
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm", Locale.getDefault());
        String currentTime = timeFormat.format(new Date());
        views.setTextViewText(R.id.last_updated, "Updated: " + currentTime);

        appWidgetManager.updateAppWidget(appWidgetId, views);
    }

    private static long calculateDaysSince(Date quitDate) {
        Date now = new Date();
        long diffInMillies = now.getTime() - quitDate.getTime();
        return TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
    }
}