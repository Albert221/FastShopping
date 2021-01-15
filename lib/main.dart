import 'dart:async';
import 'dart:isolate';

import 'package:fast_shopping/app.dart';
import 'package:fast_shopping/data/shopping_list_repository.dart';
import 'package:fast_shopping/data/migrators/v2_data_migrator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setUpCrashlytics();

  final shoppingListsRepository = ShoppingListRepository();
  await V2DataMigrator.migrate(shoppingListsRepository);

  runZonedGuarded(() {
    runApp(FastShoppingApp(
      shoppingListRepository: shoppingListsRepository,
    ));
  }, (e, st) {
    try {
      FirebaseCrashlytics.instance.recordError(e, st);
    } catch (_) {}
  });
}

Future<void> _setUpCrashlytics() async {
  try {
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final errorAndStacktrace = pair as List;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last as StackTrace,
      );
    }).sendPort);
  } catch (_) {}
}
