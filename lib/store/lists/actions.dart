import 'package:fast_shopping/models/models.dart';

class SetCurrentShoppingList {
  final ShoppingList list;

  SetCurrentShoppingList(this.list);
}

class AddShoppingList {
  final String name;

  AddShoppingList(this.name);
}

class ArchiveShoppingList {
  final ShoppingList list;

  ArchiveShoppingList(this.list);
}

class UnarchiveShoppingList {
  final ShoppingList list;

  UnarchiveShoppingList(this.list);
}

class RemoveShoppingList {
  final ShoppingList list;

  RemoveShoppingList(this.list);
}
