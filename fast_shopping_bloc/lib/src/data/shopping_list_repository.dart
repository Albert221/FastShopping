import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';

abstract class ShoppingListRepository {
  Future<String> getSelectedListId();
  Future<void> saveSelectedListId(String id);

  Future<List<ShoppingList>> getLists();
  Future<void> saveLists(List<ShoppingList> lists);
}
