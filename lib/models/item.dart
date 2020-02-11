import 'package:built_value/built_value.dart';
import 'package:uuid/uuid.dart';

part 'item.g.dart';

abstract class Item implements Built<Item, ItemBuilder> {
  String get id;

  String get shoppingListId;

  String get title;

  bool get done;

  @nullable
  DateTime get doneAt;

  bool get removed;

  Item._();

  factory Item([void Function(ItemBuilder) updates]) {
    return _$Item
        ._(
          id: Uuid().v4(),
          shoppingListId: '',
          title: '',
          done: false,
          doneAt: null,
          removed: false,
        )
        .rebuild(updates);
  }
}
