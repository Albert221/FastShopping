import 'package:fast_shopping_bloc/models.dart';

abstract class ShoppingListRepository {
  Future<String> getSelectedListId();

  Future<void> saveSelectedListId(String id);

  Future<List<ShoppingList>> getLists();

  Future<void> saveLists(List<ShoppingList> lists);
}
