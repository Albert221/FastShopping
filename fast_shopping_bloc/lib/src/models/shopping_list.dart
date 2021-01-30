import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_list.freezed.dart';
part 'shopping_list.g.dart';

@freezed
abstract class ShoppingList implements _$ShoppingList {
  const factory ShoppingList({
    @required String id,
    @required String name,
    @required DateTime createdAt,
    DateTime archivedAt,
    @Default([]) List<Item> items,
  }) = _ShoppingList;

  const ShoppingList._();

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);

  List<Item> get availableItems =>
      items.where((item) => !item.removed).toList();

  bool get allItemsDone =>
      availableItems.isNotEmpty && availableItems.every((item) => item.done);
}
