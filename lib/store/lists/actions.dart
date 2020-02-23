import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class SetCurrentShoppingList {
  final ShoppingList list;

  SetCurrentShoppingList(this.list);
}

ThunkAction<FastShoppingState> addShoppingList(String name) {
  return (Store<FastShoppingState> store) {
    store.dispatch(AddedShoppingList(name));

    final newList = store.state.lists.last;

    store.dispatch(SetCurrentShoppingList(newList));
  };
}

class AddedShoppingList {
  final String name;

  AddedShoppingList(this.name);
}

class ArchiveShoppingList {
  final ShoppingList list;

  ArchiveShoppingList(this.list);
}

class UnarchiveShoppingList {
  final ShoppingList list;

  UnarchiveShoppingList(this.list);
}

class RenameShoppingList {
  final ShoppingList list;
  final String newName;

  RenameShoppingList(this.list, this.newName);
}

class RemoveShoppingList {
  final ShoppingList list;

  RemoveShoppingList(this.list);
}
