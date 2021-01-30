import 'dart:async';

import 'package:crashlytics/crashlytics.dart';
import 'package:fast_shopping/app.dart';
import 'package:fast_shopping/data/app_settings_repository.dart';
import 'package:fast_shopping/data/migrators/v2_data_migrator.dart';
import 'package:fast_shopping/data/shopping_list_repository.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Crashlytics.initialize();

  final shoppingListsRepository = ShoppingListRepository();
  await V2DataMigrator.migrate(shoppingListsRepository);

  runZonedGuarded(() {
    runApp(FastShoppingApp(
      appSettingsRepository: AppSettingsRepository(),
      shoppingListRepository: shoppingListsRepository,
    ));
  }, Crashlytics.recordError);
}
