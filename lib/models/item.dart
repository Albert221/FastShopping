import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:uuid/uuid.dart';

part 'item.g.dart';

abstract class Item implements Built<Item, ItemBuilder> {
  factory Item([void Function(ItemBuilder) updates]) {
    return _$Item
        ._(
          id: Uuid().v4(),
          shoppingListId: '',
          title: '',
          done: false,
          removed: false,
        )
        .rebuild(updates);
  }

  Item._();

  String get id;

  String get shoppingListId;

  String get title;

  bool get done;

  @nullable
  DateTime get doneAt;

  bool get removed;

  static Serializer<Item> get serializer => _$itemSerializer;
}
