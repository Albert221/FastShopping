import 'package:built_collection/built_collection.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

final itemsReducer = combineReducers<BuiltList<Item>>([
  TypedReducer<BuiltList<Item>, AddItem>(_addItemReducer),
  TypedReducer<BuiltList<Item>, MarkItemDone>(_markItemDoneReducer),
  TypedReducer<BuiltList<Item>, MarkItemUndone>(_markItemUndoneReducer),
  TypedReducer<BuiltList<Item>, RenameItem>(_renameItemReducer),
  TypedReducer<BuiltList<Item>, RemoveItem>(_removeItemReducer),
  TypedReducer<BuiltList<Item>, UndoRemovingItem>(_undoRemovingItemReducer),
  TypedReducer<BuiltList<Item>, DeleteItem>(_deleteItemReducer),
]);

BuiltList<Item> _addItemReducer(BuiltList<Item> state, AddItem action) {
  return state.rebuild((b) => b.add(Item((b) => b..title = action.title)));
}

BuiltList<Item> _markItemDoneReducer(
    BuiltList<Item> state, MarkItemDone action) {
  return state.rebuild((b) => b.map(
        (item) => item.id == action.item.id
            ? item.rebuild((b) => b
              ..done = true
              ..doneAt = DateTime.now())
            : item,
      ));
}

BuiltList<Item> _markItemUndoneReducer(
    BuiltList<Item> state, MarkItemUndone action) {
  return state.rebuild((b) => b.map(
        (item) => item.id == action.item.id
            ? item.rebuild((b) => b
              ..done = false
              ..doneAt = null)
            : item,
      ));
}

BuiltList<Item> _renameItemReducer(BuiltList<Item> state, RenameItem action) {
  return state.rebuild((b) => b.map(
        (item) => item.id == action.item.id
            ? item.rebuild((b) => b.title = action.newTitle)
            : item,
      ));
}

BuiltList<Item> _removeItemReducer(BuiltList<Item> state, RemoveItem action) {
  return state.rebuild((b) => b.map(
        (item) => item.id == action.item.id
            ? item.rebuild((b) => b.removed = true)
            : item,
      ));
}

BuiltList<Item> _undoRemovingItemReducer(
    BuiltList<Item> state, UndoRemovingItem action) {
  return state.rebuild((b) => b.map(
        (item) => item.id == action.item.id
            ? item.rebuild((b) => b.removed = false)
            : item,
      ));
}

BuiltList<Item> _deleteItemReducer(BuiltList<Item> state, DeleteItem action) {
  return state.rebuild((b) => b.remove(action.item));
}
