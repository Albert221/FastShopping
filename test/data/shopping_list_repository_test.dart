import 'package:fast_shopping/data/shopping_list_repository.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ShoppingListRepository', () {
    test('returns correct selected list id', () {
      SharedPreferences.setMockInitialValues({
        'v3-selected-list-id': 'some test id',
      });

      final id = ShoppingListRepository().getSelectedListId();

      expect(id, completion('some test id'));
    });

    test('saves selected list id', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();

      await ShoppingListRepository().saveSelectedListId('this is an id');

      expect(prefs.getString('v3-selected-list-id'), 'this is an id');
    });

    test('returns correct lists', () {
      SharedPreferences.setMockInitialValues({
        'v3-lists':
            '''[{"id":"it's id","name":"Groceries","createdAt":"2020-12-12T19:46:00.000Z","archivedAt":null,"items":[]}]''',
      });

      final lists = ShoppingListRepository().getLists();

      expect(
        lists,
        completion([
          ShoppingList(
            id: "it's id",
            name: 'Groceries',
            createdAt: DateTime.utc(2020, 12, 12, 19, 46),
          ),
        ]),
      );
    });

    test('returns empty list when no saved lists', () {
      SharedPreferences.setMockInitialValues({});

      final lists = ShoppingListRepository().getLists();

      expect(lists, completion(isEmpty));
    });

    test('saves lists', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();

      await ShoppingListRepository().saveLists([
        ShoppingList(
          id: 'some id',
          name: 'This is a name',
          createdAt: DateTime.utc(2020, 12, 12, 19, 43),
          items: const [
            Item(id: 'item id', title: 'Butter'),
          ],
        ),
      ]);

      expect(
        prefs.getString('v3-lists'),
        '[{"id":"some id","name":"This is a name","createdAt":"2020-12-12T19:43:00.000Z","archivedAt":null,"items":[{"id":"item id","title":"Butter","doneAt":null,"removed":false}]}]',
      );
    });
  });
}
