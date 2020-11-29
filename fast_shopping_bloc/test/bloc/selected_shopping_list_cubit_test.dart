import 'package:bloc_test/bloc_test.dart';
import 'package:fast_shopping_bloc/src/bloc/selected_shopping_list_cubit.dart';
import 'package:fast_shopping_bloc/src/bloc/shopping_lists_cubit.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../clock.dart';
import '../fixtures.dart';
import '../mocks.dart';

void main() {
  group('SelectedShoppingListCubit', () {
    ShoppingListsCubit shoppingListsCubit;
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

      cubit = SelectedShoppingListCubit(shoppingListsCubit, clock);
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

        return SelectedShoppingListCubit(shoppingListsCubit, clock);
      },
      expect: [
        const SelectedShoppingListState(null),
        SelectedShoppingListState(shoppingList1),
        SelectedShoppingListState(shoppingList1.copyWith(name: 'This is test')),
      ],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'adds an item to the shopping list correctly',
      build: () => cubit,
      act: (cubit) => cubit.add(orphanItem1),
      verify: (cubit) {
        verify(
          shoppingListsCubit.update(shoppingList1.copyWith(
            items: [item1, item2, item3, orphanItem1],
          )),
        ).called(1);
      },
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'fails adding an item to the shopping list without one selected',
      build: () => cubit,
      seed: const SelectedShoppingListState(null),
      act: (cubit) => cubit.add(item1),
      errors: [isA<Exception>()],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'sets an item done correctly',
      build: () => cubit,
      act: (cubit) => cubit.setDone(item2.id, true),
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
      act: (cubit) => cubit.setDone(item2.id, false),
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
      act: (cubit) => cubit.setTitle(item2.id, 'New title!'),
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
      act: (cubit) => cubit.startEditing(),
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
      act: (cubit) => cubit.startEditing(),
      errors: [isA<Exception>()],
    );

    blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
      'stops editing an item correctly',
      build: () => cubit,
      seed: SelectedShoppingListState(
        shoppingList1,
        itemActionState: ItemActionState.editing(item2.id),
      ),
      act: (cubit) => cubit.stopEditing(),
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
      act: (cubit) => cubit.stopEditing(),
      errors: [isA<Exception>()],
    );
  });
}
