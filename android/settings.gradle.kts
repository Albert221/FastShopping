import java.util.Properties

include("app")

val localProperties = Properties().apply {
    load(file("local.properties").inputStream())
}

val flutterSdkPath: String? = localProperties.getProperty("flutter.sdk")
assert(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }

apply(from = "$flutterSdkPath/packages/flutter_tools/gradle/app_plugin_loader.gradle")
