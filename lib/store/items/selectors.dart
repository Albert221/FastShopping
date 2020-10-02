import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

class ItemsSelectors {
  static List<Item> currentListItems(Store<FastShoppingState> store) =>
      store.state.items
          .where((item) => item.shoppingListId == store.state.currentListId)
          .toList()
            ..sort((a, b) {
              if (a.done == b.done) return 0;

              return a.done ? 1 : -1;
            });

  static bool isCurrentListEveryItemDoneOrDeleted(
          Store<FastShoppingState> store) =>
      currentListItems(store)
          .where((item) => !item.removed)
          .every((item) => item.done);

  static int itemsCount(Store<FastShoppingState> store, String listId) =>
      store.state.items
          .where((item) => item.shoppingListId == listId && !item.removed)
          .length;
}
