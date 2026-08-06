import java.util.Properties
import java.io.FileInputStream
plugins {
    id("com.android.application")
    kotlin("android")
    id("dev.flutter.flutter-gradle-plugin")
}
android {
    namespace = "com.quitter.app"
    // permission_handler 13 requires Android API 37.
    compileSdk = 37
    ndkVersion = "29.0.14206865"
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true
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
                val abiName = filters.find { it.filterType == "ABI" }?.identifier
                
                if (abiName != null && abiVersionCodes.containsKey(abiName)) {
                    // Split APK with specific ABI
                    val newVersionCode = baseVersionCode * 10 + abiVersionCodes[abiName]!!
                    versionCodeOverride = newVersionCode
                } else {
                    // Universal APK (no ABI filter) - use highest suffix (3)
                    val universalVersionCode = baseVersionCode * 10 + 3
                    versionCodeOverride = universalVersionCode
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
            val keyPropertiesFile = rootProject.file("key.properties")
            if (keyPropertiesFile.exists()) {
                signingConfig = signingConfigs.getByName("release")
            }
            // If key.properties doesn't exist, signingConfig remains null (unsigned)
        }
        debug {
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
kotlin {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
    }
}
flutter {
    source = "../.."
}
configurations.all {
    resolutionStrategy {
        force("androidx.glance:glance:1.1.1")
        force("androidx.glance:glance-appwidget:1.1.1")
    }
}

dependencies {
    implementation("com.google.android.material:material:1.14.0")
    implementation("androidx.appcompat:appcompat:1.7.1")
    implementation("androidx.constraintlayout:constraintlayout:2.2.2")
    implementation("androidx.navigation:navigation-fragment:2.9.8")
    implementation("androidx.navigation:navigation-ui:2.9.8")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
    implementation("androidx.work:work-runtime-ktx:2.11.2")
    // If you need GCM support (for older devices or specific use cases), uncomment the line below:
    // implementation("androidx.work:work-gcm:2.2.0")
    
    implementation(kotlin("stdlib-jdk8"))
}
