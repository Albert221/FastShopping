import 'package:freezed_annotation/freezed_annotation.dart';

import 'item.dart';

part 'shopping_list.freezed.dart';

@freezed
abstract class ShoppingList with _$ShoppingList {
  const factory ShoppingList({
    @required String id,
    @required String name,
    DateTime createdAt,
    @Default(false) archived,
    @Default([]) List<Item> items,
  }) = _ShoppingList;
}
