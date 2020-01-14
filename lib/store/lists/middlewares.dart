import 'package:fast_shopping/store/state.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

void ensureShoppingListAvailable(
    Store<FastShoppingState> store, action, NextDispatcher next) {
  if (action is! AddShoppingList && action is! SetCurrentShoppingList) {
    // If current list is null or is archived
    if (store.state.currentList == null || store.state.currentList.archived) {
      // First not archived list
      final firstList = store.state.lists
          .firstWhere((list) => !list.archived, orElse: () => null);
      if (firstList == null) {
        store.dispatch(AddShoppingList('Shopping list 1'));
      } else {
        store.dispatch(SetCurrentShoppingList(firstList));
      }
    }
  }

  next(action);
}
