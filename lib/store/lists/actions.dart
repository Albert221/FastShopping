import 'package:fast_shopping/models/models.dart';

// Shopping list actions

class AddShoppingList {
  final String name;

  AddShoppingList(this.name);
}

class SetCurrentShoppingList {
  final ShoppingList list;

  SetCurrentShoppingList(this.list);
}

// Item actions
class AddItem {
  final ShoppingList list;
  final String title;

  AddItem(this.list, this.title);
}

class MarkItemDone {
  final ShoppingList list;
  final Item item;

  MarkItemDone(this.list, this.item);
}

class MarkItemUndone {
  final ShoppingList list;
  final Item item;

  MarkItemUndone(this.list, this.item);
}

class RenameItem {
  final ShoppingList list;
  final Item item;
  final String newTitle;

  RenameItem(this.list, this.item, this.newTitle);
}

class RemoveItem {
  final ShoppingList list;
  final Item item;

  RemoveItem(this.list, this.item);
}

class UndoRemovingItem {
  final ShoppingList list;
  final Item item;

  UndoRemovingItem(this.list, this.item);
}

/// Doesn't mark item as removed but completely deletes it from
/// any persistent storage.
class DeleteItem {
  final ShoppingList list;
  final Item item;

  DeleteItem(this.list, this.item);
}
