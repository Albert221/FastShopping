import 'package:fast_shopping/models/models.dart';

class AddShoppingList {
  final String id;
  final String name;

  AddShoppingList(this.name, {this.id});
}

class SetCurrentShoppingList {
  final ShoppingList list;

  SetCurrentShoppingList(this.list);
}
