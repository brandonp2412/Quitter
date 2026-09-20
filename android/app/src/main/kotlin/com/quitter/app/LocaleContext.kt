package com.quitter.app

import android.content.Context
import android.content.res.Configuration
import java.util.Locale

internal fun Context.withQuitterLocale(): Context {
    val preferences = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
    val localeCode = preferences.getString("flutter.locale", "system")
    if (localeCode !in setOf("en", "es", "ja", "ru", "zh")) return this

    val configuration = Configuration(resources.configuration)
    configuration.setLocale(Locale.forLanguageTag(localeCode))
    return createConfigurationContext(configuration)
}
