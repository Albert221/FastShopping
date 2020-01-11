import 'package:fast_shopping/models/models.dart';

class AddItem {
  final String title;

  AddItem(this.title);
}

class MarkItemDone {
  final Item item;

  MarkItemDone(this.item);
}

class MarkItemUndone {
  final Item item;

  MarkItemUndone(this.item);
}

class RenameItem {
  final Item item;
  final String newTitle;

  RenameItem(this.item, this.newTitle);
}

class RemoveItem {
  final Item item;

  RemoveItem(this.item);
}

class UndoRemovingItem {
  final Item item;

  UndoRemovingItem(this.item);
}

/// Doesn't mark item as removed but completely deletes it from
/// any persistent storage.
class DeleteItem {
  final Item item;

  DeleteItem(this.item);
}
