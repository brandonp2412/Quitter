import java.util.Properties
import java.io.FileInputStream
plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}
android {
    namespace = "com.quitter.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }
    
    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }
    
    defaultConfig {
        applicationId = "com.quitter.app"
        minSdk = Math.max(flutter.minSdkVersion.toInt(), 23) // WorkManager requires API level 23 or higher
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        
        // Remove any NDK abiFilters to avoid conflicts
        ndk {
            abiFilters.clear()
        }
    }
    
    // Override version codes for split APKs and universal APKs
    applicationVariants.all {
        outputs.all {
            val baseVersionCode = flutter.versionCode
            
            // Map ABI to suffix numbers (matching your GitHub Actions pattern)
            val abiVersionCodes = mapOf(
                "x86_64" to 1,
                "armeabi-v7a" to 2,
                "arm64-v8a" to 3
            )
            
            if (this is com.android.build.gradle.internal.api.ApkVariantOutputImpl) {
                val output = this as com.android.build.gradle.internal.api.ApkVariantOutputImpl
                val abiName = output.filters.find { it.filterType == "ABI" }?.identifier
                
                if (abiName != null && abiVersionCodes.containsKey(abiName)) {
                    // Split APK with specific ABI
                    val newVersionCode = baseVersionCode * 10 + abiVersionCodes[abiName]!!
                    output.versionCodeOverride = newVersionCode
                } else {
                    // Universal APK (no ABI filter) - use highest suffix (3)
                    val universalVersionCode = baseVersionCode * 10 + 3
                    output.versionCodeOverride = universalVersionCode
                }
            }
        }
    }
    
    signingConfigs {
        create("release") {
            val keyProperties = Properties()
            val keyPropertiesFile = rootProject.file("key.properties")
            if (keyPropertiesFile.exists()) {
                keyProperties.load(FileInputStream(keyPropertiesFile))
                keyAlias = keyProperties["keyAlias"] as String?
                keyPassword = keyProperties["keyPassword"] as String?
                storeFile = if (keyProperties["storeFile"] != null) {
                    rootProject.file("app/" + keyProperties["storeFile"] as String)
                } else {
                    null
                }
                storePassword = keyProperties["storePassword"] as String?
            }
        }
    }
    
    buildTypes {
        release {
            val keyProperties = Properties()
            val keyPropertiesFile = rootProject.file("key.properties")
            if (keyPropertiesFile.exists()) {
                signingConfig = signingConfigs.getByName("release")
            }
            // If key.properties doesn't exist, signingConfig remains null (unsigned)
        }
        debug {
            val keyProperties = Properties()
            val keyPropertiesFile = rootProject.file("key.properties")
            // Use release signing if available, otherwise fall back to default debug
            signingConfig = if (keyPropertiesFile.exists() && signingConfigs.getByName("release").storeFile != null) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
        }
    }
    
    dependenciesInfo {
        includeInApk = false
        includeInBundle = false
    }
    buildFeatures {
        viewBinding = true
    }
}
flutter {
    source = "../.."
}
dependencies {
    implementation("com.google.android.material:material:1.10.0")
    implementation("androidx.appcompat:appcompat:1.7.1")
    implementation("androidx.constraintlayout:constraintlayout:2.2.1")
    implementation("androidx.navigation:navigation-fragment:2.6.0")
    implementation("androidx.navigation:navigation-ui:2.6.0")
    implementation("androidx.work:work-runtime-ktx:2.7.0")
    implementation("androidx.security:security-crypto:1.0.0")
    implementation(kotlin("stdlib-jdk8"))

    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}