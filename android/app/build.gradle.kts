import java.util.Properties

val localProperties = Properties().apply {
    load(rootProject.file("local.properties").inputStream())
}

val flutterRoot: String = localProperties.getProperty("flutter.sdk")
        ?: throw GradleException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")
val flutterVersionCode: String = localProperties.getProperty("flutter.versionCode") ?: "1"
val flutterVersionName: String = localProperties.getProperty("flutter.versionName") ?: "1.0"

val keystoreProperties = Properties().apply {
    load(rootProject.file("key.properties").inputStream())
}

plugins {
    id("com.android.application")
    kotlin("android")
    kotlin("android.extensions")
}

apply(from = "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle")
apply(from = "flutter.gradle")

android {
    compileSdkVersion(29)
    sourceSets.getByName("main") {
        manifest.srcFile("src/main/AndroidManifest.xml")
        java.srcDirs("src/main/kotlin")
    }
    lintOptions {
        disable("InvalidPackage")
    }

    defaultConfig {
        applicationId = "me.wolszon.fastshopping"

        minSdkVersion(16)
        targetSdkVersion(29)
        versionCode = flutterVersionCode.toInt()
        versionName = flutterVersionName
    }

    signingConfigs {
        create("release") {
            val file = keystoreProperties["storeFile"] as String?

            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
            storeFile = if (file != null) file(file) else null
            storePassword = keystoreProperties["storePassword"] as String?
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
        }

        getByName("debug") {
            applicationIdSuffix = ".debug"
            isDebuggable = true
        }
    }
}

val kotlinVersion: String by rootProject.extra

dependencies {
    implementation(kotlin("stdlib-jdk7", version = kotlinVersion))
}
