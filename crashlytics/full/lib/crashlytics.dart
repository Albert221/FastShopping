library crashlytics;

import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class Crashlytics {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final errorAndStacktrace = pair as List;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last as StackTrace,
      );
    }).sendPort);
  }

  static Future<void> recordError(dynamic exception, StackTrace stack) =>
      FirebaseCrashlytics.instance.recordError(exception, stack);
}
