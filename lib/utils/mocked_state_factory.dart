import 'package:built_collection/built_collection.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/state.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:flutter/widgets.dart';

FastShoppingState getMockedState(BuildContext context) {
  const currentListId = '3964c54a-2d61-441d-8875-fb3e92de927a';
  const otherListId = '235c5b31-4dfe-407c-ba19-0c39de15c460';
  final twoMinutesAgo =
      DateTime.now().toUtc().subtract(const Duration(minutes: 2));
  final yesterday = DateTime.now().toUtc().subtract(const Duration(days: 1));
  final threeDaysAgo = DateTime.now().toUtc().subtract(const Duration(days: 3));

  return FastShoppingState(
    (s) => s
      ..currentListId = currentListId
      ..lists = BuiltList<ShoppingList>([
        ShoppingList((l) => l
          ..id = currentListId
          ..createdAt = yesterday
          ..name = S.of(context).screenshot_list_1),
        ShoppingList((l) => l
          ..id = otherListId
          ..createdAt = threeDaysAgo
          ..name = S.of(context).screenshot_list_2),
      ]).toBuilder()
      ..items = BuiltList<Item>([
        Item((i) => i
          ..shoppingListId = currentListId
          ..title = S.of(context).screenshot_item_1),
        Item((i) => i
          ..id = '21827905-af88-4ff2-88a1-490e40d835d8'
          ..shoppingListId = currentListId
          ..done = true
          ..doneAt = twoMinutesAgo
          ..title = S.of(context).screenshot_item_2),
        Item((i) => i
          ..shoppingListId = currentListId
          ..done = true
          ..doneAt = twoMinutesAgo
          ..title = S.of(context).screenshot_item_3),
        Item((i) => i
          ..shoppingListId = currentListId
          ..title = S.of(context).screenshot_item_4),
        Item((i) => i
          ..shoppingListId = currentListId
          ..done = true
          ..doneAt = twoMinutesAgo
          ..title = S.of(context).screenshot_item_5),
        Item((i) => i
          ..shoppingListId = currentListId
          ..title = S.of(context).screenshot_item_6),
        Item((i) => i
          ..shoppingListId = currentListId
          ..title = S.of(context).screenshot_item_7),
        Item((i) => i
          ..shoppingListId = currentListId
          ..done = true
          ..doneAt = twoMinutesAgo
          ..title = S.of(context).screenshot_item_8),
        Item((i) => i..shoppingListId = otherListId),
        Item((i) => i..shoppingListId = otherListId),
      ]).toBuilder(),
  );
}
