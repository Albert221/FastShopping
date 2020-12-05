import 'package:freezed_annotation/freezed_annotation.dart';

import 'item.dart';

part 'shopping_list.freezed.dart';

@freezed
abstract class ShoppingList implements _$ShoppingList {
  const factory ShoppingList({
    @required String id,
    @required String name,
    DateTime createdAt,
    DateTime archivedAt,
    @Default([]) List<Item> items,
  }) = _ShoppingList;

  const ShoppingList._();

  bool get allItemsDone =>
      items.isNotEmpty && items.every((item) => item.doneAt != null);
}
