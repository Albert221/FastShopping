import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';

abstract class AppSettingsRepository {
  Future<ShoppingListsMode> getShoppingListsMode();
  Future<void> setShoppingListsMode(ShoppingListsMode shoppingListsMode);

  Future<DarkMode> getDarkMode();
  Future<void> setDarkMode(DarkMode darkMode);

  Future<ItemsLayout> getItemsLayout();
  Future<void> setItemsLayout(ItemsLayout itemsLayout);

  Future<bool> getMoveDoneToEnd();
  // ignore: avoid_positional_boolean_parameters
  Future<void> setMoveDoneToEnd(bool moveDoneToEnd);
}
