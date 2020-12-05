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

  List<Item> get availableItems =>
      items.where((item) => !item.removed).toList();

  bool get allItemsDone =>
      availableItems.isNotEmpty &&
      availableItems.every((item) => item.doneAt != null);
}
