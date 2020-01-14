import 'package:built_collection/built_collection.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

final listsReducer = combineReducers<BuiltList<ShoppingList>>([
  TypedReducer<BuiltList<ShoppingList>, AddShoppingList>(
      _addShoppingListReducer),
  TypedReducer<BuiltList<ShoppingList>, AddItem>(_addItemReducer),
  TypedReducer<BuiltList<ShoppingList>, MarkItemDone>(_markItemDoneReducer),
  TypedReducer<BuiltList<ShoppingList>, MarkItemUndone>(_markItemUndoneReducer),
  TypedReducer<BuiltList<ShoppingList>, RenameItem>(_renameItemReducer),
  TypedReducer<BuiltList<ShoppingList>, RemoveItem>(_removeItemReducer),
  TypedReducer<BuiltList<ShoppingList>, UndoRemovingItem>(
      _undoRemovingItemReducer),
  TypedReducer<BuiltList<ShoppingList>, DeleteItem>(_deleteItemReducer),
]);

BuiltList<ShoppingList> _addShoppingListReducer(
    BuiltList<ShoppingList> state, AddShoppingList action) {
  final shoppingList = ShoppingList((b) => b..name = action.name);

  return state.rebuild((b) => b.add(shoppingList));
}

BuiltList<ShoppingList> _rebuildList(BuiltList<ShoppingList> lists,
    ShoppingList list, Function(ShoppingListBuilder) updates) {
  return lists.rebuild((b) => b.map(
        (listA) => listA.id == list.id ? listA.rebuild(updates) : listA,
      ));
}

BuiltList<ShoppingList> _addItemReducer(
    BuiltList<ShoppingList> state, AddItem action) {
  final item = Item((b) => b..title = action.title);

  return _rebuildList(state, action.list, (b) => b.items.add(item));
}

BuiltList<ShoppingList> _markItemDoneReducer(
    BuiltList<ShoppingList> state, MarkItemDone action) {
  return _rebuildList(
      state,
      action.list,
      (b) => b.items.map(
            (item) => item.id == action.item.id
                ? item.rebuild((b) => b
                  ..done = true
                  ..doneAt = DateTime.now())
                : item,
          ));
}

BuiltList<ShoppingList> _markItemUndoneReducer(
    BuiltList<ShoppingList> state, MarkItemUndone action) {
  return _rebuildList(
      state,
      action.list,
      (b) => b.items.map(
            (item) => item.id == action.item.id
                ? item.rebuild((b) => b
                  ..done = false
                  ..doneAt = null)
                : item,
          ));
}

BuiltList<ShoppingList> _renameItemReducer(
    BuiltList<ShoppingList> state, RenameItem action) {
  return _rebuildList(
      state,
      action.list,
      (b) => b.items.map(
            (item) => item.id == action.item.id
                ? item.rebuild((b) => b.title = action.newTitle)
                : item,
          ));
}

BuiltList<ShoppingList> _removeItemReducer(
    BuiltList<ShoppingList> state, RemoveItem action) {
  return _rebuildList(
      state,
      action.list,
      (b) => b.items.map(
            (item) => item.id == action.item.id
                ? item.rebuild((b) => b.removed = true)
                : item,
          ));
}

BuiltList<ShoppingList> _undoRemovingItemReducer(
    BuiltList<ShoppingList> state, UndoRemovingItem action) {
  return _rebuildList(
      state,
      action.list,
      (b) => b.items.map(
            (item) => item.id == action.item.id
                ? item.rebuild((b) => b.removed = false)
                : item,
          ));
}

BuiltList<ShoppingList> _deleteItemReducer(
    BuiltList<ShoppingList> state, DeleteItem action) {
  return _rebuildList(state, action.list, (b) => b.items.remove(action.item));
}
