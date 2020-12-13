import 'dart:convert';

import 'package:fast_shopping_bloc/data.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class V2DataMigrator {
  const V2DataMigrator._();

  static const _v2DataKey = 'V2-DATA';

  /// Example V2 data:
  ///
  /// ```json
  /// {
  ///     "currentListId": "84b64e80-7ff5-473f-b029-e77a68c3bba1",
  ///     "lists": [
  ///         {
  ///             "id": "84b64e80-7ff5-473f-b029-e77a68c3bba1",
  ///             "name": "Test",
  ///             "createdAt": 1607793362376435,
  ///             "archived": false
  ///         },
  ///         {
  ///             "id": "3f38eb20-7479-4e83-b3fe-3bac1c0a41e8",
  ///             "name": "sdfdsfsd",
  ///             "createdAt": 1607793381781069,
  ///             "archived": true,
  ///             "archivedAt": 1607793393580899
  ///         }
  ///     ],
  ///     "items": [
  ///         {
  ///             "id": "138638b6-b870-4827-bb3c-eb991c231615",
  ///             "shoppingListId": "84b64e80-7ff5-473f-b029-e77a68c3bba1",
  ///             "title": "Maslo",
  ///             "done": true,
  ///             "removed": false,
  ///             "doneAt": 1607793374058611
  ///         },
  ///         {
  ///             "id": "bcc3f6b7-484a-4daf-8139-78074ac55944",
  ///             "shoppingListId": "84b64e80-7ff5-473f-b029-e77a68c3bba1",
  ///             "title": "Bulki",
  ///             "done": false,
  ///             "removed": false
  ///         },
  ///         {
  ///             "id": "89b240fc-a68b-4054-83c7-3e13de2e46b8",
  ///             "shoppingListId": "3f38eb20-7479-4e83-b3fe-3bac1c0a41e8",
  ///             "title": "d",
  ///             "done": false,
  ///             "removed": false
  ///         }
  ///     ]
  /// }
  /// ```
  static Future<void> migrate(ShoppingListRepository repository) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    if (!sharedPrefs.containsKey(_v2DataKey)) return;

    final data = sharedPrefs.getString(_v2DataKey);
    final json = jsonDecode(data) as Map<String, dynamic>;

    await _map(json, repository);

    await sharedPrefs.remove(_v2DataKey);
  }

  static Future<void> _map(
    Map<String, dynamic> json,
    ShoppingListRepository repository,
  ) async {
    final selectedListId = json['currentListId'] as String;
    if (selectedListId != null) {
      await repository.saveSelectedListId(selectedListId);
    }

    final lists = List<Map<String, dynamic>>.from(json['lists'] as List);
    final items = List<Map<String, dynamic>>.from(json['items'] as List);

    final shoppingLists = lists.map((list) {
      final listId = list['id'] as String;

      final listItems = items.where(
        (item) => item['shoppingListId'] == listId && item['removed'] == false,
      );

      return ShoppingList(
        id: listId,
        name: list['name'] as String,
        createdAt: DateTime.fromMicrosecondsSinceEpoch(
          list['createdAt'] as int,
          isUtc: true,
        ),
        archivedAt: (list['archived'] as bool)
            ? DateTime.fromMicrosecondsSinceEpoch(
                list['archivedAt'] as int,
                isUtc: true,
              )
            : null,
        items: listItems.map((item) {
          return Item(
            id: item['id'] as String,
            title: item['title'] as String,
            doneAt: (item['done'] as bool)
                ? DateTime.fromMicrosecondsSinceEpoch(
                    item['doneAt'] as int,
                    isUtc: true,
                  )
                : null,
          );
        }).toList(),
      );
    }).toList();

    await repository.saveLists(shoppingLists);
  }
}
