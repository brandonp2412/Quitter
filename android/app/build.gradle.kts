import java.io.File
import java.io.FileInputStream
import java.util.Properties
plugins {
    id("com.android.application")
    id("dev.flutter.flutter-gradle-plugin")
}
android {
    namespace = "com.quitter.app"
    compileSdk = 37
    ndkVersion = flutter.ndkVersion
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }
    
    defaultConfig {
        applicationId = "com.quitter.app"
        minSdk = Math.max(flutter.minSdkVersion.toInt(), 23) // WorkManager requires API level 23 or higher
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        
        ndk {
            abiFilters.clear()
        }
    }
    
    // Override version codes for split APKs and universal APKs
    applicationVariants.all {
        outputs.all {
            val baseVersionCode = flutter.versionCode
            
            val abiVersionCodes = mapOf(
                "x86_64" to 1,
                "armeabi-v7a" to 2,
                "arm64-v8a" to 3
            )
            
            if (this is com.android.build.gradle.internal.api.ApkVariantOutputImpl) {
                val abiName = filters.find { it.filterType == "ABI" }?.identifier
                
                if (abiName != null && abiVersionCodes.containsKey(abiName)) {
                    val newVersionCode = baseVersionCode * 10 + abiVersionCodes[abiName]!!
                    versionCodeOverride = newVersionCode
                } else {
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
                storeFile = (keyProperties["storeFile"] as String?)?.let { storeFilePath ->
                    val configuredStoreFile = File(storeFilePath)
                    if (configuredStoreFile.isAbsolute) {
                        configuredStoreFile
                    } else {
                        rootProject.file("app/$storeFilePath")
                    }
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
        }
        debug {
            applicationIdSuffix = ".debug"
            val keyPropertiesFile = rootProject.file("key.properties")
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
    testOptions {
        execution = "ANDROIDX_TEST_ORCHESTRATOR"
    }
}
kotlin {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_11)
    }
}
flutter {
    source = "../.."
}
configurations.all {
    resolutionStrategy {
        force("androidx.glance:glance:1.1.0")
        force("androidx.glance:glance-appwidget:1.1.0")
    }
}

dependencies {
    // Flutter 3.47 registers integration_test in release but excludes its dev-only Android dependency.
    releaseImplementation(project(":integration_test"))
    androidTestUtil("androidx.test:orchestrator:1.5.1")
    implementation("com.google.android.material:material:1.10.0")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("androidx.work:work-runtime-ktx:2.7.0")
    implementation(kotlin("stdlib-jdk8"))
}
