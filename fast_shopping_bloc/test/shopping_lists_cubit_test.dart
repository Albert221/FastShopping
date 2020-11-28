import 'package:bloc_test/bloc_test.dart';
import 'package:fast_shopping_bloc/src/bloc/shopping_lists_cubit.dart';
import 'package:fast_shopping_bloc/src/data/shopping_list_repository.dart';
import 'package:fast_shopping_bloc/src/models/shopping_list.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'clock.dart';
import 'mocks.dart';

void main() {
  group('ShoppingListsCubit', () {
    ShoppingListRepository repository;
    ShoppingListsCubit cubit;
    setUp(() {
      repository = MockShoppingListRepository();
      cubit = ShoppingListsCubit(repository, clock);
    });
    tearDown(() => cubit.close());

    test('has correct initial state', () {
      expect(cubit.state, ShoppingListsState());
    });

    blocTest<ShoppingListsCubit, ShoppingListsState>(
      'loads lists from repository',
      build: () {
        when(repository.getSelectedListId()).thenAnswer((_) async => null);
        when(repository.getLists()).thenAnswer((_) async => [shoppingList1]);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: [
        ShoppingListsState(lists: [shoppingList1]),
      ],
      verify: (cubit) {
        verify(repository.getSelectedListId()).called(1);
        verify(repository.getLists()).called(1);
      },
    );
  });
}

final shoppingList1 = ShoppingList(
  id: '42c644d3-f37d-49f0-962d-15859e1d0355',
  name: 'Some shopping list',
  createdAt: clock.now(),
  items: [],
);
