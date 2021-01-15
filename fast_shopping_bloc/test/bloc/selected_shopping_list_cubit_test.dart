import 'package:bloc_test/bloc_test.dart';
import 'package:fast_shopping_bloc/src/bloc/selected_shopping_list_cubit.dart';
import 'package:fast_shopping_bloc/src/bloc/shopping_lists_cubit.dart';
import 'package:fast_shopping_bloc/src/models/item.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../clock.dart';
import '../fixtures.dart';
import '../mocks.dart';

void main() {
  group('SelectedShoppingListCubit', () {
    ShoppingListsCubit shoppingListsCubit;
    Uuid uuid;
    SelectedShoppingListCubit cubit;

    setUp(() {
      shoppingListsCubit = MockShoppingListsCubit();
      when(shoppingListsCubit.state).thenReturn(
        ShoppingListsState(
          selectedId: shoppingList1.id,
          lists: [shoppingList1],
        ),
      );
      whenListen<ShoppingListsState>(shoppingListsCubit, const Stream.empty());

      uuid = MockUuid();

      cubit = SelectedShoppingListCubit(shoppingListsCubit, clock, uuid);
    });
    tearDown(() => cubit.close());

    test('has correct initial state', () {
      expect(cubit.state, SelectedShoppingListState(shoppingList1));
    });

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'correctly updates with shopping lists cubit updates',
      build: () {
        whenListen(
          shoppingListsCubit,
          Stream.fromIterable([
            ShoppingListsState(lists: [shoppingList1]),
            ShoppingListsState(
              selectedId: shoppingList1.id,
              lists: [shoppingList1],
            ),
            ShoppingListsState(
              selectedId: shoppingList1.id,
              lists: [
                shoppingList1.copyWith(name: 'This is test'),
              ],
            ),
          ]),
        );

        return SelectedShoppingListCubit(shoppingListsCubit, clock, uuid);
      },
      expect: [
        const SelectedShoppingListState(null),
        SelectedShoppingListState(shoppingList1),
        SelectedShoppingListState(shoppingList1.copyWith(name: 'This is test')),
      ],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'adds an item to the shopping list correctly',
      build: () {
        when(uuid.v4()).thenReturn('some id');
        return cubit;
      },
      act: (cubit) => cubit.addItem('Title'),
      verify: (cubit) {
        verify(
          shoppingListsCubit.update(shoppingList1.copyWith(
            items: [
              item1,
              item2,
              item3,
              const Item(id: 'some id', title: 'Title'),
            ],
          )),
        ).called(1);
      },
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'fails adding an item to the shopping list without one selected',
      build: () => cubit,
      seed: const SelectedShoppingListState(null),
      act: (cubit) => cubit.addItem('some id'),
      errors: [isA<Exception>()],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'removes an item from the shopping list',
      build: () => cubit,
      seed: SelectedShoppingListState(shoppingList1),
      act: (cubit) => cubit.removeItem(item3.id),
      verify: (cubit) {
        verify(
          shoppingListsCubit.update(shoppingList1.copyWith(
            items: [item1, item2, item3.copyWith(removed: true)],
          )),
        ).called(1);
      },
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'fails to remove an item from the shopping list without one selected',
      build: () => cubit,
      seed: const SelectedShoppingListState(null),
      act: (cubit) => cubit.removeItem(item3.id),
      errors: [isA<Exception>()],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'undoes remove an item from the shopping list',
      build: () => cubit,
      seed: SelectedShoppingListState(shoppingList1.copyWith(
        items: [item1, item2.copyWith(removed: true), item3],
      )),
      act: (cubit) => cubit.undoRemoveItem(item2.id),
      verify: (cubit) {
        verify(
          shoppingListsCubit.update(shoppingList1.copyWith(
            items: [item1, item2, item3],
          )),
        ).called(1);
      },
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'fails to undo remove an item from '
      'the shopping list without one selected',
      build: () => cubit,
      seed: const SelectedShoppingListState(null),
      act: (cubit) => cubit.undoRemoveItem(item2.id),
      errors: [isA<Exception>()],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'moves item correctly to new index',
      build: () => cubit,
      seed: SelectedShoppingListState(shoppingList1),
      act: (cubit) => cubit.moveItem(0, 2),
      verify: (cubit) {
        verify(
          shoppingListsCubit.update(shoppingList1.copyWith(
            items: [item2, item3, item1],
          )),
        ).called(1);
      },
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'moves item correctly to new index after removed item',
      build: () => cubit,
      seed: SelectedShoppingListState(shoppingList1.copyWith(
        items: [item1, item2, removedItem, item3],
      )),
      act: (cubit) => cubit.moveItem(0, 2),
      verify: (cubit) {
        verify(
          shoppingListsCubit.update(shoppingList1.copyWith(
            items: [item2, removedItem, item3, item1],
          )),
        ).called(1);
      },
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'sets an item done correctly',
      build: () => cubit,
      act: (cubit) => cubit.setItemDone(item2.id, true),
      verify: (cubit) {
        verify(
          shoppingListsCubit.update(shoppingList1.copyWith(
            items: [item1, item2.copyWith(doneAt: clock.now()), item3],
          )),
        ).called(1);
      },
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'sets an item not done correctly',
      build: () => cubit,
      act: (cubit) => cubit.setItemDone(item2.id, false),
      seed: SelectedShoppingListState(shoppingList1.copyWith(
        items: [item1, item2.copyWith(doneAt: clock.now()), item3],
      )),
      verify: (cubit) {
        verify(
          shoppingListsCubit.update(shoppingList1.copyWith(
            items: [item1, item2.copyWith(doneAt: null), item3],
          )),
        ).called(1);
      },
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'sets an item title correctly',
      build: () => cubit,
      act: (cubit) => cubit.setItemTitle(item2.id, 'New title!'),
      verify: (cubit) {
        verify(
          shoppingListsCubit.update(shoppingList1.copyWith(
            items: [item1, item2.copyWith(title: 'New title!'), item3],
          )),
        ).called(1);
      },
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'expands item correctly',
      build: () => cubit,
      act: (cubit) => cubit.expandItem(item2.id),
      expect: [
        SelectedShoppingListState(
          shoppingList1,
          itemActionState: ItemActionState.expanded(item2.id),
        ),
      ],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'expands item while editing correctly',
      build: () => cubit,
      seed: SelectedShoppingListState(
        shoppingList1,
        itemActionState: ItemActionState.editing(item3.id),
      ),
      act: (cubit) => cubit.expandItem(item2.id),
      expect: [
        SelectedShoppingListState(
          shoppingList1,
          itemActionState: ItemActionState.expanded(item2.id),
        ),
      ],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'collapses item correctly',
      build: () => cubit,
      seed: SelectedShoppingListState(
        shoppingList1,
        itemActionState: ItemActionState.expanded(item2.id),
      ),
      act: (cubit) => cubit.collapseItem(),
      expect: [
        SelectedShoppingListState(shoppingList1),
      ],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'starts editing an item correctly',
      build: () => cubit,
      seed: SelectedShoppingListState(
        shoppingList1,
        itemActionState: ItemActionState.expanded(item2.id),
      ),
      act: (cubit) => cubit.startEditingItem(),
      expect: [
        SelectedShoppingListState(
          shoppingList1,
          itemActionState: ItemActionState.editing(item2.id),
        ),
      ],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'fails starting editing an item when none are expanded',
      build: () => cubit,
      act: (cubit) => cubit.startEditingItem(),
      errors: [isA<Exception>()],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'stops editing an item correctly',
      build: () => cubit,
      seed: SelectedShoppingListState(
        shoppingList1,
        itemActionState: ItemActionState.editing(item2.id),
      ),
      act: (cubit) => cubit.stopEditingItem(),
      expect: [
        SelectedShoppingListState(
          shoppingList1,
          itemActionState: ItemActionState.expanded(item2.id),
        ),
      ],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'fails stopping editing an item when none is being edited correctly',
      build: () => cubit,
      seed: SelectedShoppingListState(shoppingList1),
      act: (cubit) => cubit.stopEditingItem(),
      errors: [isA<Exception>()],
    );
  });
}
