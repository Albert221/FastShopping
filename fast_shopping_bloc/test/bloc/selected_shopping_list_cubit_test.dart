import 'package:bloc_test/bloc_test.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
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

    group('adds item to shopping list', () {
      blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
        'correctly',
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
        'with exception if none is selected',
        build: () => cubit,
        seed: const SelectedShoppingListState(null),
        act: (cubit) => cubit.addItem('some id'),
        errors: [isA<Exception>()],
      );
    });

    group('removes item from shopping list', () {
      blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
        'correctly',
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
        'with exception if none is selected',
        build: () => cubit,
        seed: const SelectedShoppingListState(null),
        act: (cubit) => cubit.removeItem(item3.id),
        errors: [isA<Exception>()],
      );
    });

    group('undoes removing item from shopping list', () {
      blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
        'correctly',
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
        'with exception if none is selected',
        build: () => cubit,
        seed: const SelectedShoppingListState(null),
        act: (cubit) => cubit.undoRemoveItem(item2.id),
        errors: [isA<Exception>()],
      );
    });

    group('moves item correctly from old to new index', () {
      blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
        'correctly',
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
        'with removed items correctly',
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
    });

    group('sets an item done', () {
      blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
        'without moving done to the end correctly',
        build: () => cubit,
        act: (cubit) => cubit.setItemDone(item1.id, true),
        verify: (cubit) {
          verify(
            shoppingListsCubit.update(shoppingList1.copyWith(
              items: [item1.copyWith(doneAt: clock.now()), item2, item3],
            )),
          ).called(1);
        },
      );

      group('with moving done to the end', () {
        blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
          'with one done item not at the end correctly',
          build: () => cubit,
          act: (cubit) =>
              cubit.setItemDone(item1.id, true, moveDoneToEnd: true),
          verify: (cubit) {
            verify(
              shoppingListsCubit.update(shoppingList1.copyWith(
                items: [item2, item3, item1.copyWith(doneAt: clock.now())],
              )),
            ).called(1);
          },
        );

        blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
          'with one done item at the end correctly',
          build: () => cubit,
          seed: SelectedShoppingListState(shoppingList1.copyWith(
            items: [item1, item3, item2],
          )),
          act: (cubit) =>
              cubit.setItemDone(item1.id, true, moveDoneToEnd: true),
          verify: (cubit) {
            verify(
              shoppingListsCubit.update(shoppingList1.copyWith(
                items: [item3, item1.copyWith(doneAt: clock.now()), item2],
              )),
            ).called(1);
          },
        );
      });
    });

    group('sets an item not done', () {
      blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
        'without moving done to the end correctly',
        build: () => cubit,
        seed: SelectedShoppingListState(shoppingList1.copyWith(
          items: [item1, item2.copyWith(doneAt: clock.now()), item3],
        )),
        act: (cubit) => cubit.setItemDone(item2.id, false),
        verify: (cubit) {
          verify(
            shoppingListsCubit.update(shoppingList1.copyWith(
              items: [item1, item2.copyWith(doneAt: null), item3],
            )),
          ).called(1);
        },
      );

      group('with moving done to the end', () {
        blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
          'when item is not in the last done items group correctly',
          build: () => cubit,
          seed: SelectedShoppingListState(shoppingList1.copyWith(
            items: [item2, item1, item3.copyWith(doneAt: clock.now())],
          )),
          act: (cubit) =>
              cubit.setItemDone(item2.id, false, moveDoneToEnd: true),
          verify: (cubit) {
            verify(
              shoppingListsCubit.update(shoppingList1.copyWith(
                items: [
                  item2.copyWith(doneAt: null),
                  item1,
                  item3.copyWith(doneAt: clock.now()),
                ],
              )),
            ).called(1);
          },
        );

        blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
          'when item is at the beggining of the last done items group correctly',
          build: () => cubit,
          seed: SelectedShoppingListState(shoppingList1.copyWith(
            items: [item1, item2, item3.copyWith(doneAt: clock.now())],
          )),
          act: (cubit) =>
              cubit.setItemDone(item2.id, false, moveDoneToEnd: true),
          verify: (cubit) {
            verify(
              shoppingListsCubit.update(shoppingList1.copyWith(
                items: [
                  item1,
                  item2.copyWith(doneAt: null),
                  item3.copyWith(doneAt: clock.now()),
                ],
              )),
            ).called(1);
          },
        );

        blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
          'when item is in the last done items group correctly',
          build: () => cubit,
          seed: SelectedShoppingListState(shoppingList1.copyWith(
            items: [item1, item3.copyWith(doneAt: clock.now()), item2],
          )),
          act: (cubit) =>
              cubit.setItemDone(item2.id, false, moveDoneToEnd: true),
          verify: (cubit) {
            verify(
              shoppingListsCubit.update(shoppingList1.copyWith(
                items: [
                  item1,
                  item2.copyWith(doneAt: null),
                  item3.copyWith(doneAt: clock.now()),
                ],
              )),
            ).called(1);
          },
        );
      });
    });

    group('sets an item title', () {
      blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
        'correctly',
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
        'and trims it correctly',
        build: () => cubit,
        act: (cubit) => cubit.setItemTitle(item2.id, ' I have many spaces    '),
        verify: (cubit) {
          verify(
            shoppingListsCubit.update(shoppingList1.copyWith(
              items: [
                item1,
                item2.copyWith(title: 'I have many spaces'),
                item3,
              ],
            )),
          ).called(1);
        },
      );
    });

    group('expands item', () {
      blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
        'correctly',
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
        'while editing other item correctly',
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
    });

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

    group('starts editing item', () {
      blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
        'correctly',
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
        'with exception when none are expanded',
        build: () => cubit,
        act: (cubit) => cubit.startEditingItem(),
        errors: [isA<Exception>()],
      );
    });

    group('stops editing item', () {
      blocTest<SelectedShoppingListCubit, SelectedShoppingListState>(
        'correctly',
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
        'with exception when none are being edited',
        build: () => cubit,
        seed: SelectedShoppingListState(shoppingList1),
        act: (cubit) => cubit.stopEditingItem(),
        errors: [isA<Exception>()],
      );
    });
  });

  group('ItemActionState', () {
    group('isExpanded', () {
      test('returns false for none', () {
        const state = ItemActionState.none();

        expect(state.isExpanded('id'), false);
      });
      test('returns true for expanded item', () {
        const state = ItemActionState.expanded('id');

        expect(state.isExpanded('id'), true);
      });

      test('returns true for editing item', () {
        const state = ItemActionState.editing('id');

        expect(state.isExpanded('id'), true);
      });
    });

    group('isEditing', () {
      test('returns false for none', () {
        const state = ItemActionState.none();

        expect(state.isEditing('id'), false);
      });
      test('returns false for expanded item', () {
        const state = ItemActionState.expanded('id');

        expect(state.isEditing('id'), false);
      });

      test('returns true for editing item', () {
        const state = ItemActionState.editing('id');

        expect(state.isEditing('id'), true);
      });
    });
  });
}
