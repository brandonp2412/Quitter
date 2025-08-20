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
    }
    
    // Conditionally enable ABI splits only for APK builds
    if (project.gradle.startParameter.taskNames.any { it.contains("assemble") && !it.contains("bundle") }) {
        splits {
            abi {
                isEnable = true
                reset()
                include("x86_64", "armeabi-v7a", "arm64-v8a")
                isUniversalApk = false
            }
        }
    }
    
    // Override version codes for each ABI (APK only)
    applicationVariants.all {
        outputs.all {
            val baseVersionCode = flutter.versionCode
            
            // Map ABI to suffix numbers (matching your GitHub Actions pattern)
            val abiVersionCodes = mapOf(
                "x86_64" to 1,
                "armeabi-v7a" to 2,
                "arm64-v8a" to 3
            )
            
            // Only apply to APK outputs, not AAB (App Bundle)
            if (this is com.android.build.gradle.internal.api.ApkVariantOutputImpl) {
                val output = this as com.android.build.gradle.internal.api.ApkVariantOutputImpl
                val abiName = output.filters.find { it.filterType == "ABI" }?.identifier
                
                if (abiName != null && abiVersionCodes.containsKey(abiName)) {
                    val newVersionCode = baseVersionCode * 10 + abiVersionCodes[abiName]!!
                    output.versionCodeOverride = newVersionCode
                    println("Setting version code for $abiName APK: $newVersionCode")
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
            }
            keyAlias = keyProperties["keyAlias"] as String?
            keyPassword = keyProperties["keyPassword"] as String?
            storeFile = if (keyProperties["storeFile"] != null) {
                rootProject.file(keyProperties["storeFile"] as String)
            } else {
                null
            }
            storePassword = keyProperties["storePassword"] as String?
        }
    }
    
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
    
    dependenciesInfo {
        includeInApk = false
        includeInBundle = false
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("androidx.work:work-runtime-ktx:2.7.0")
    // If you need GCM support (for older devices or specific use cases), uncomment the line below:
    // implementation("androidx.work:work-gcm:2.2.0")
    
    implementation(kotlin("stdlib-jdk8"))
}