import 'package:fast_shopping/app.dart';
import 'package:fast_shopping/data/shopping_list_repository.dart';
import 'package:fast_shopping/data/migrators/v2_data_migrator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final shoppingListsRepository = ShoppingListRepository();
  await V2DataMigrator.migrate(shoppingListsRepository);

  runApp(FastShoppingApp(
    shoppingListRepository: shoppingListsRepository,
  ));
}
