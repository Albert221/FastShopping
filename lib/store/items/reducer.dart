import 'package:built_collection/built_collection.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

final itemsReducer = combineReducers<BuiltList<Item>>([
  TypedReducer(_addItemReducer),
  TypedReducer(_markItemDoneReducer),
  TypedReducer(_markItemUndoneReducer),
  TypedReducer(_renameItemReducer),
  TypedReducer(_removeItemReducer),
  TypedReducer(_undoRemovingItemReducer),
  TypedReducer(_deleteItemReducer),
]);

BuiltList<Item> _addItemReducer(BuiltList<Item> state, AddItem action) {
  final item = Item((b) => b
    ..title = action.title
    ..shoppingListId = action.listId);

  return state.rebuild((b) => b..add(item));
}

BuiltList<Item> _markItemDoneReducer(
    BuiltList<Item> state, MarkItemDone action) {
  return state.rebuild((b) => b
    ..map(
      (item) => item.id == action.item.id
          ? item.rebuild((b) => b
            ..done = true
            ..doneAt = DateTime.now().toUtc())
          : item,
    ));
}

BuiltList<Item> _markItemUndoneReducer(
    BuiltList<Item> state, MarkItemUndone action) {
  return state.rebuild((b) => b
    ..map(
      (item) => item.id == action.item.id
          ? item.rebuild((b) => b
            ..done = false
            ..doneAt = null)
          : item,
    ));
}

BuiltList<Item> _renameItemReducer(BuiltList<Item> state, RenameItem action) {
  return state.rebuild((b) => b
    ..map(
      (item) => item.id == action.item.id
          ? item.rebuild((b) => b..title = action.newTitle)
          : item,
    ));
}

BuiltList<Item> _removeItemReducer(BuiltList<Item> state, RemoveItem action) {
  return state.rebuild((b) => b
    ..map(
      (item) => item.id == action.item.id
          ? item.rebuild((b) => b..removed = true)
          : item,
    ));
}

BuiltList<Item> _undoRemovingItemReducer(
    BuiltList<Item> state, UndoRemovingItem action) {
  return state.rebuild((b) => b
    ..map(
      (item) => item.id == action.item.id
          ? item.rebuild((b) => b..removed = false)
          : item,
    ));
}

BuiltList<Item> _deleteItemReducer(BuiltList<Item> state, DeleteItem action) {
  return state.rebuild((b) => b
    ..removeWhere(
      (item) => item.id == action.item.id,
    ));
}
