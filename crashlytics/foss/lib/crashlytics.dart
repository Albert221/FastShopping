library crashlytics;

class Crashlytics {
  static Future<void> initialize() async {}
  static Future<void> recordError(dynamic exception, StackTrace stack) =>
      throw exception;
}
