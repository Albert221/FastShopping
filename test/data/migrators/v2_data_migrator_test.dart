import 'package:fast_shopping/data/migrators/v2_data_migrator.dart';
import 'package:fast_shopping_bloc/data.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mocks.dart';

void main() {
  group('V2DataMigrator', () {
    ShoppingListRepository repository;
    setUp(() {
      repository = MockShoppingListRepository();
    });

    test('does nothing when there is no v2 data', () async {
      await V2DataMigrator.migrate(repository);

      verifyNever(repository.saveSelectedListId(any));
      verifyNever(repository.saveLists(any));
    });

    test('correctly migrates v2 data', () async {
      SharedPreferences.setMockInitialValues({
        'V2-DATA': '''
{
    "currentListId": "84b64e80-7ff5-473f-b029-e77a68c3bba1",
    "lists": [
        {
            "id": "84b64e80-7ff5-473f-b029-e77a68c3bba1",
            "name": "Test",
            "createdAt": 1607793362000000,
            "archived": false
        },
        {
            "id": "3f38eb20-7479-4e83-b3fe-3bac1c0a41e8",
            "name": "sdfdsfsd",
            "createdAt": 1607793381000000,
            "archived": true,
            "archivedAt": 1607793393000000
        }
    ],
    "items": [
        {
            "id": "138638b6-b870-4827-bb3c-eb991c231615",
            "shoppingListId": "84b64e80-7ff5-473f-b029-e77a68c3bba1",
            "title": "Maslo",
            "done": true,
            "removed": false,
            "doneAt": 1607793374000000
        },
        {
            "id": "bcc3f6b7-484a-4daf-8139-78074ac55944",
            "shoppingListId": "84b64e80-7ff5-473f-b029-e77a68c3bba1",
            "title": "Bulki",
            "done": false,
            "removed": false
        },
        {
            "id": "89b240fc-a68b-4054-83c7-3e13de2e46b8",
            "shoppingListId": "3f38eb20-7479-4e83-b3fe-3bac1c0a41e8",
            "title": "Cebula",
            "done": false,
            "removed": false
        }
    ]
}
        ''',
      });

      await V2DataMigrator.migrate(repository);

      verify(
        repository.saveSelectedListId('84b64e80-7ff5-473f-b029-e77a68c3bba1'),
      ).called(1);

      verify(repository.saveLists([
        ShoppingList(
          id: '84b64e80-7ff5-473f-b029-e77a68c3bba1',
          name: 'Test',
          createdAt: DateTime.utc(2020, 12, 12, 17, 16, 2),
          items: [
            Item(
              id: '138638b6-b870-4827-bb3c-eb991c231615',
              title: 'Maslo',
              doneAt: DateTime.utc(2020, 12, 12, 17, 16, 14),
            ),
            const Item(
              id: 'bcc3f6b7-484a-4daf-8139-78074ac55944',
              title: 'Bulki',
            ),
          ],
        ),
        ShoppingList(
          id: '3f38eb20-7479-4e83-b3fe-3bac1c0a41e8',
          name: 'sdfdsfsd',
          createdAt: DateTime.utc(2020, 12, 12, 17, 16, 21),
          archivedAt: DateTime.utc(2020, 12, 12, 17, 16, 33),
          items: [
            const Item(
              id: '89b240fc-a68b-4054-83c7-3e13de2e46b8',
              title: 'Cebula',
            )
          ],
        ),
      ])).called(1);
    });
  });
}
