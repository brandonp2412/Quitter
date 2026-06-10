package com.quitter.app

import android.app.Activity
import android.appwidget.AppWidgetManager
import android.content.Intent
import android.os.Bundle
import androidx.core.content.edit
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import org.json.JSONArray

class WidgetSelectionActivity : Activity() {
    private var appWidgetId = AppWidgetManager.INVALID_APPWIDGET_ID

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_widget_selection)
        setResult(RESULT_CANCELED)

        appWidgetId = intent?.extras?.getInt(
            AppWidgetManager.EXTRA_APPWIDGET_ID,
            AppWidgetManager.INVALID_APPWIDGET_ID
        ) ?: AppWidgetManager.INVALID_APPWIDGET_ID

        if (appWidgetId == AppWidgetManager.INVALID_APPWIDGET_ID) {
            finish()
            return
        }

        setupRecyclerView()
    }

    private fun setupRecyclerView() {
        val recyclerView = findViewById<RecyclerView>(R.id.addiction_grid)
        recyclerView.layoutManager = GridLayoutManager(this, 2)

        // Display metadata for all known addiction keys
        val knownAddictions = mapOf(
            "alcohol" to Triple(getString(R.string.addiction_alcohol), R.drawable.ic_local_bar, 0xFF6366F1.toInt()),
            "vaping" to Triple(getString(R.string.addiction_vaping), R.drawable.ic_air, 0xFF06B6D4.toInt()),
            "smoking" to Triple(getString(R.string.addiction_smoking), R.drawable.ic_eco, 0xFF10B981.toInt()),
            "marijuana" to Triple(getString(R.string.addiction_marijuana), R.drawable.ic_grass, 0xFF84E680.toInt()),
            "nicotine_pouches" to Triple(getString(R.string.addiction_nicotine_pouches), R.drawable.ic_scatter_plot, 0xFFF59E0B.toInt()),
            "opioids" to Triple(getString(R.string.addiction_opioids), R.drawable.ic_medication, 0xFFEC4899.toInt()),
            "social_media" to Triple(getString(R.string.addiction_social_media), R.drawable.ic_public, 0xFF8B5CF6.toInt()),
            "pornography" to Triple(getString(R.string.addiction_pornography), R.drawable.ic_block, 0xFFF43F5E.toInt()),
            "cocaine" to Triple(getString(R.string.addiction_cocaine), R.drawable.ic_medication, 0xFF3B82F6.toInt()),
            "meth" to Triple(getString(R.string.addiction_meth), R.drawable.ic_medication, 0xFF14B8A6.toInt()),
            "benzos" to Triple(getString(R.string.addiction_benzos), R.drawable.ic_medication, 0xFF6D5DD3.toInt()),
            "adderall" to Triple(getString(R.string.addiction_adderall), R.drawable.ic_medication, 0xFFFF8C42.toInt()),
            "ssri" to Triple(getString(R.string.addiction_ssri), R.drawable.ic_medication, 0xFF7C3AED.toInt()),
            "snri" to Triple(getString(R.string.addiction_snri), R.drawable.ic_medication, 0xFF6D28D9.toInt()),
            "tca" to Triple(getString(R.string.addiction_tca), R.drawable.ic_medication, 0xFF5B21B6.toInt()),
            "maoi" to Triple(getString(R.string.addiction_maoi), R.drawable.ic_medication, 0xFF4C1D95.toInt()),
            "nitrous_oxide" to Triple(getString(R.string.addiction_nitrous_oxide), R.drawable.ic_air, 0xFF38BDF8.toInt())
        )

        val prefs = getSharedPreferences("FlutterSharedPreferences", MODE_PRIVATE)

        // Read active addiction keys written by Flutter
        val activeKeysJson = prefs.getString("flutter.active_addiction_keys", null)
        val activeKeys = mutableListOf<String>()
        if (activeKeysJson != null) {
            val jsonArray = JSONArray(activeKeysJson)
            for (i in 0 until jsonArray.length()) {
                activeKeys.add(jsonArray.getString(i))
            }
        } else {
            // Fallback: scan prefs for known keys (for backwards compatibility)
            for (key in knownAddictions.keys) {
                if (prefs.getString("flutter.$key", null) != null) {
                    activeKeys.add(key)
                }
            }
        }

        val quitAddictions = activeKeys.mapNotNull { key ->
            val meta = knownAddictions[key]
            if (meta != null) {
                AddictionItem(key, meta.first, meta.second, meta.third)
            } else {
                // Unknown key — still show it with a fallback icon
                AddictionItem(key, key.replace('_', ' '), R.drawable.star, 0xFF888888.toInt())
            }
        }

        val entriesJson = prefs.getString("flutter.entries", null)
        val entriesList = mutableListOf<AddictionItem>()
        if (entriesJson != null) {
            val jsonArray = JSONArray(entriesJson)
            for (i in 0 until jsonArray.length()) {
                val entryObject = jsonArray.getJSONObject(i)
                val id = entryObject.getString("id")
                val title = entryObject.getString("title")
                val color = entryObject.getInt("color")
                entriesList.add(AddictionItem(id, title, R.drawable.star, color))
            }
        }

        recyclerView.adapter = AddictionAdapter(quitAddictions.plus(entriesList)) { addiction ->
            selectAddiction(addiction.key)
        }
    }

    private fun selectAddiction(addictionKey: String) {
        val prefs = getSharedPreferences("QuitTrackerWidget", MODE_PRIVATE)
        prefs.edit { putString("selected_$appWidgetId", addictionKey) }

        val appWidgetManager = AppWidgetManager.getInstance(this)
        QuitTrackerWidget.updateAppWidget(this, appWidgetManager, appWidgetId)

        val resultValue = Intent()
        resultValue.putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
        setResult(RESULT_OK, resultValue)
        finish()
    }

    data class AddictionItem(
        val key: String,
        val title: String,
        val iconRes: Int,
        val color: Int
    )
}
