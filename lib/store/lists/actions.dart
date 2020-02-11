import 'package:fast_shopping/models/models.dart';

class AddShoppingList {
  final String name;

  AddShoppingList(this.name);
}

class SetCurrentShoppingList {
  final ShoppingList list;

  SetCurrentShoppingList(this.list);
}
