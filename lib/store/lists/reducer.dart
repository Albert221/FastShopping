import 'package:built_collection/built_collection.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

final listsReducer = combineReducers<BuiltList<ShoppingList>>([
  TypedReducer(_addShoppingListReducer),
]);

BuiltList<ShoppingList> _addShoppingListReducer(
    BuiltList<ShoppingList> state, AddShoppingList action) {
  final shoppingList = ShoppingList((b) => b..name = action.name);

  return state.rebuild((b) => b.add(shoppingList));
}
