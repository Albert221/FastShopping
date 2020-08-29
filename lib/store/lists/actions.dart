import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class SetCurrentShoppingList {
  SetCurrentShoppingList(this.list);

  final ShoppingList list;
}

ThunkAction<FastShoppingState> addShoppingList(String name) {
  return (Store<FastShoppingState> store) {
    store.dispatch(AddedShoppingList(name));

    final newList = store.state.lists.last;

    store.dispatch(SetCurrentShoppingList(newList));
  };
}

class AddedShoppingList {
  AddedShoppingList(this.name);

  final String name;
}

class ArchiveShoppingList {
  ArchiveShoppingList(this.list);

  final ShoppingList list;
}

class UnarchiveShoppingList {
  UnarchiveShoppingList(this.list);

  final ShoppingList list;
}

class RenameShoppingList {
  RenameShoppingList(this.list, this.newName);

  final ShoppingList list;
  final String newName;
}

class RemoveShoppingList {
  RemoveShoppingList(this.list);

  final ShoppingList list;
}
