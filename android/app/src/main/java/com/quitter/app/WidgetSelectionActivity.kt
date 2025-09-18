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

        val addictions = listOf(
            AddictionItem("alcohol", "Alcohol", R.drawable.ic_local_bar, 0xFF6366F1.toInt()),
            AddictionItem("vaping", "Vaping", R.drawable.ic_air, 0xFF06B6D4.toInt()),
            AddictionItem("smoking", "Smoking", R.drawable.ic_eco, 0xFF10B981.toInt()),
            AddictionItem("marijuana", "Marijuana", R.drawable.ic_grass, 0xFF84E680.toInt()),
            AddictionItem(
                "nicotine_pouches",
                "Nicotine Pouches",
                R.drawable.ic_scatter_plot,
                0xFFF59E0B.toInt()
            ),
            AddictionItem("opioids", "Opioids", R.drawable.ic_medication, 0xFFEC4899.toInt()),
            AddictionItem("social_media", "Social Media", R.drawable.ic_public, 0xFF8B5CF6.toInt()),
            AddictionItem("pornography", "Pornography", R.drawable.ic_block, 0xFFF43F5E.toInt())
        )

        val prefs = getSharedPreferences("FlutterSharedPreferences", MODE_PRIVATE)
        val quitAddictions = addictions.filter { addiction ->
            prefs.getString("flutter.${addiction.key}", null) != null
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