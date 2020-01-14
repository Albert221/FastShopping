import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

FastShoppingState rootReducer(FastShoppingState state, action) {
  return state.rebuild(
    (b) => b
      ..lists.replace(listsReducer(state.lists, action))
      ..currentListId = _currentListIdReducer(state.currentListId, action),
  );
}

final _currentListIdReducer = combineReducers<String>([
  TypedReducer<String, SetCurrentShoppingList>(_setCurrentShoppingListReducer),
]);

String _setCurrentShoppingListReducer(
    String state, SetCurrentShoppingList action) {
  return action.list.id;
}
