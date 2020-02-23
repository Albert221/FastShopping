import 'package:built_collection/built_collection.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

final listsReducer = combineReducers<BuiltList<ShoppingList>>([
  TypedReducer(_addedShoppingListReducer),
  TypedReducer(_archiveShoppingListReducer),
  TypedReducer(_unarchiveShoppingListReducer),
  TypedReducer(_renameShoppingListReducer),
  TypedReducer(_removeShoppingListReducer),
]);

BuiltList<ShoppingList> _addedShoppingListReducer(
    BuiltList<ShoppingList> state, AddedShoppingList action) {
  final shoppingList = ShoppingList(
    (b) => b
      ..name = action.name
      ..createdAt = DateTime.now().toUtc(),
  );

  return state.rebuild((b) => b..add(shoppingList));
}

BuiltList<ShoppingList> _archiveShoppingListReducer(
    BuiltList<ShoppingList> state, ArchiveShoppingList action) {
  return state.rebuild((b) => b
    ..map(
      (list) => list.id == action.list.id
          ? list.rebuild((b) => b
            ..archived = true
            ..archivedAt = DateTime.now().toUtc())
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

BuiltList<ShoppingList> _renameShoppingListReducer(
    BuiltList<ShoppingList> state, RenameShoppingList action) {
  return state.rebuild((b) => b
    ..map(
      (list) => list.id == action.list.id
          ? list.rebuild((b) => b..name = action.newName)
          : list,
    ));
}

BuiltList<ShoppingList> _removeShoppingListReducer(
    BuiltList<ShoppingList> state, RemoveShoppingList action) {
  return state.rebuild((b) => b
    ..removeWhere(
      (list) => list.id == action.list.id,
    ));
}
