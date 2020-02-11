import 'package:built_collection/built_collection.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

final listsReducer = combineReducers<BuiltList<ShoppingList>>([
  TypedReducer(_addShoppingListReducer),
  TypedReducer(_archiveShoppingListReducer),
  TypedReducer(_unarchiveShoppingListReducer),
]);

BuiltList<ShoppingList> _addShoppingListReducer(
    BuiltList<ShoppingList> state, AddShoppingList action) {
  final shoppingList = ShoppingList((b) => b..name = action.name);

  return state.rebuild((b) => b.add(shoppingList));
}

BuiltList<ShoppingList> _archiveShoppingListReducer(
    BuiltList<ShoppingList> state, ArchiveShoppingList action) {
  return state.rebuild((b) => b
    ..map(
      (list) => list.id == action.list.id
          ? list.rebuild((b) => b
            ..archived = true
            ..archivedAt = DateTime.now())
          : list,
    ));
}

BuiltList<ShoppingList> _unarchiveShoppingListReducer(
    BuiltList<ShoppingList> state, UnarchiveShoppingList action) {
  return state.rebuild((b) => b
    ..map(
      (list) => list.id == action.list.id
          ? list.rebuild((b) => b
            ..archived = false
            ..archivedAt = null)
          : list,
    ));
}
