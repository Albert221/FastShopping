import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

FastShoppingState rootReducer(FastShoppingState state, action) {
  if (action is LoadedData) {
    return action.state;
  }

  return state.rebuild(
    (b) => b
      ..currentListId = _currentListIdReducer(state.currentListId, action)
      ..lists.replace(listsReducer(state.lists, action))
      ..items.replace(itemsReducer(state.items, action)),
  );
}

final _currentListIdReducer = combineReducers<String>([
  TypedReducer<String, SetCurrentShoppingList>(_setCurrentShoppingListReducer),
]);

String _setCurrentShoppingListReducer(
    String state, SetCurrentShoppingList action) {
  return action.list.id;
}
