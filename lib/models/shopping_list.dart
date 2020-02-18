import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:uuid/uuid.dart';

part 'shopping_list.g.dart';

abstract class ShoppingList
    implements Built<ShoppingList, ShoppingListBuilder> {
  String get id;

  String get name;

  DateTime get createdAt;

  bool get archived;

  @nullable
  DateTime get archivedAt;

  ShoppingList._();

  factory ShoppingList([void Function(ShoppingListBuilder) updates]) {
    return _$ShoppingList
        ._(
          id: Uuid().v4(),
          name: '',
          createdAt: DateTime.now().toUtc(),
          archived: false,
          archivedAt: null,
        )
        .rebuild(updates);
  }

  static Serializer<ShoppingList> get serializer => _$shoppingListSerializer;
}
