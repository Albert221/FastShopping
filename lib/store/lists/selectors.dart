import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';

class ListsSelectors {
  static bool anyListChoosen(Store<FastShoppingState> store) =>
      currentList(store) != null;

  static ShoppingList currentList(Store<FastShoppingState> store) =>
      store.state.lists.firstWhere(
        (list) => list.id == store.state.currentListId && !list.archived,
        orElse: () => null,
      );

  static List<ShoppingList> allCurrent(Store<FastShoppingState> store) =>
      store.state.lists.where((list) => !list.archived).toList()
        ..sort((a, b) => -a.createdAt.compareTo(b.createdAt));

  static List<ShoppingList> allArchived(Store<FastShoppingState> store) =>
      store.state.lists.where((list) => list.archived).toList()
        ..sort((a, b) => -a.archivedAt.compareTo(b.archivedAt));
}
