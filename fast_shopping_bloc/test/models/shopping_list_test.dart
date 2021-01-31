import 'package:test/test.dart';

import '../clock.dart';
import '../fixtures.dart';

void main() {
  group('ShoppingList', () {
    group('anyItemDone', () {
      test('returns false when there are none items done', () {
        expect(shoppingList2.anyItemDone, false);
      });

      test('returns true when there are some items done', () {
        expect(shoppingList1.anyItemDone, true);
      });
    });

    group('allItemsDone', () {
      test('returns false when there are no items', () {
        expect(shoppingList2.allItemsDone, false);
      });

      test('returns false when there are some items not done', () {
        expect(shoppingList1.allItemsDone, false);
      });

      test('returns true when all items are done', () {
        final list = shoppingList2.copyWith(items: [
          item2, // it's already done
          item3.copyWith(doneAt: clock.now()),
        ]);

        expect(list.allItemsDone, true);
      });
    });
  });
}
