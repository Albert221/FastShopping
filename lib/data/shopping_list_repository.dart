import 'package:fast_shopping_bloc/data.dart' as data;
import 'package:fast_shopping_bloc/models.dart';

class ShoppingListRepository extends data.ShoppingListRepository {
  @override
  Future<String> getSelectedListId() async {
    return null;
  }

  @override
  Future<void> saveSelectedListId(String id) async {}

  @override
  Future<List<ShoppingList>> getLists() async {
    return [];
  }

  @override
  Future<void> saveLists(List<ShoppingList> lists) async {}
}
