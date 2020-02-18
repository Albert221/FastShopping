import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:fast_shopping/models/models.dart';

part 'state.g.dart';

abstract class FastShoppingState
    implements Built<FastShoppingState, FastShoppingStateBuilder> {
  String get currentListId;

  BuiltList<ShoppingList> get lists;

  BuiltList<Item> get items;

  FastShoppingState._();

  factory FastShoppingState([void Function(FastShoppingStateBuilder) updates]) {
    return _$FastShoppingState
        ._(
          lists: BuiltList<ShoppingList>(),
          items: BuiltList<Item>(),
          currentListId: '',
        )
        .rebuild(updates);
  }

  ShoppingList get currentList => lists.firstWhere(
        (list) => list.id == currentListId && !list.archived,
        orElse: () => null,
      );

  List<Item> get currentListItems =>
      items.where((item) => item.shoppingListId == currentListId).toList();

  static Serializer<FastShoppingState> get serializer =>
      _$fastShoppingStateSerializer;
}
