import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:uuid/uuid.dart';

part 'state.g.dart';

abstract class FastShoppingState
    implements Built<FastShoppingState, FastShoppingStateBuilder> {
  String get currentListId;

  BuiltList<ShoppingList> get lists;

  BuiltList<Item> get items;

  FastShoppingState._();

  factory FastShoppingState([void Function(FastShoppingStateBuilder) updates]) {
    final listId = Uuid().v4();

    return _$FastShoppingState
        ._(
          lists: BuiltList<ShoppingList>([
            ShoppingList(
              (b) => b..id = listId,
            ),
          ]),
          items: BuiltList<Item>(),
          currentListId: listId,
        )
        .rebuild(updates);
  }

  ShoppingList get currentList =>
      lists.firstWhere((list) => list.id == currentListId, orElse: () => null);

  List<Item> get currentListItems =>
      items.where((item) => item.shoppingListId == currentListId).toList();
}
