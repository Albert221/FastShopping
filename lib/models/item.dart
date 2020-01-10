class Item {
  String title;
  bool done;
  DateTime doneAt;
  bool removed = false;

  Item(this.title, [this.done = false, this.doneAt]);
}
