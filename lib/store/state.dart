import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:fast_shopping/models/shopping_list.dart';
import 'package:uuid/uuid.dart';

part 'state.g.dart';

abstract class FastShoppingState
    implements Built<FastShoppingState, FastShoppingStateBuilder> {
  BuiltList<ShoppingList> get lists;

  ShoppingList get currentList =>
      lists.firstWhere((list) => list.id == currentListId, orElse: () => null);

  String get currentListId;

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
          currentListId: listId,
        )
        .rebuild(updates);
  }
}
