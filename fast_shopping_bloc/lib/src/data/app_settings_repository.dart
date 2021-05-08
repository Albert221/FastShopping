import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';

abstract class AppSettingsRepository {
  Future<ShoppingListsMode?> getShoppingListsMode();
  Future<void> saveShoppingListsMode(ShoppingListsMode shoppingListsMode);

  Future<DarkTheme?> getDarkTheme();
  Future<void> saveDarkTheme(DarkTheme darkTheme);

  Future<ItemsLayout?> getItemsLayout();
  Future<void> saveItemsLayout(ItemsLayout itemsLayout);

  Future<bool?> getMoveDoneToEnd();
  // ignore: avoid_positional_boolean_parameters
  Future<void> saveMoveDoneToEnd(bool moveDoneToEnd);
}
