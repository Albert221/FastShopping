import 'package:built_value/built_value.dart';
import 'package:uuid/uuid.dart';

part 'shopping_list.g.dart';

abstract class ShoppingList
    implements Built<ShoppingList, ShoppingListBuilder> {
  String get id;

  String get name;

  bool get archived;

  @nullable
  DateTime get archivedAt;

  ShoppingList._();

  factory ShoppingList([void Function(ShoppingListBuilder) updates]) {
    return _$ShoppingList
        ._(
          id: Uuid().v4(),
          name: '',
          archived: false,
          archivedAt: null,
        )
        .rebuild(updates);
  }
}
