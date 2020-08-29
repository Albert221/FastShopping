import 'package:fast_shopping/models/models.dart';

class AddItem {
  AddItem(this.title, this.listId);

  final String title;
  final String listId;
}

class MarkItemDone {
  MarkItemDone(this.item);

  final Item item;
}

class MarkItemUndone {
  MarkItemUndone(this.item);

  final Item item;
}

class RenameItem {
  RenameItem(this.item, this.newTitle);

  final Item item;
  final String newTitle;
}

class RemoveItem {
  RemoveItem(this.item);

  final Item item;
}

class UndoRemovingItem {
  UndoRemovingItem(this.item);

  final Item item;
}

/// Doesn't mark item as removed but completely deletes it from
/// any persistent storage.
class DeleteItem {
  DeleteItem(this.item);

  final Item item;
}
