import 'package:bloc_test/bloc_test.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../clock.dart';
import '../fixtures.dart';
import '../mocks.dart';

void main() {
  group('ShoppingListsCubit', () {
    late MockShoppingListRepository repository;
    late Uuid uuid;
    late ShoppingListsCubit cubit;
    setUp(() {
      repository = MockShoppingListRepository();
      uuid = MockUuid();
      cubit = ShoppingListsCubit(repository, clock, uuid);
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
      expect: () => [
        ShoppingListsState(lists: [shoppingList1]),
      ],
      verify: (cubit) {
        verify(repository.getSelectedListId()).called(1);
        verify(repository.getLists()).called(1);
      },
    );

    blocTest<ShoppingListsCubit, ShoppingListsState>(
      'saves lists to repository on every emit',
      build: () => cubit,
      act: (cubit) => cubit
        ..emit(ShoppingListsState(lists: []))
        ..emit(ShoppingListsState(lists: [shoppingList1])),
      verify: (cubit) {
        verify(repository.saveSelectedListId(null)).called(2);

        verify(repository.saveLists([])).called(1);
        verify(repository.saveLists([shoppingList1])).called(1);
      },
    );

    blocTest<ShoppingListsCubit, ShoppingListsState>(
      'adds a shopping list correctly',
      build: () {
        when(uuid.v4()).thenReturn('some id');
        return cubit;
      },
      act: (cubit) => cubit.addList('Nice list'),
      expect: () => [
        ShoppingListsState(lists: [
          ShoppingList(
            id: 'some id',
            name: 'Nice list',
            createdAt: clock.now(),
          ),
        ]),
      ],
    );

    blocTest<ShoppingListsCubit, ShoppingListsState>(
      'updates existing shopping list correctly',
      build: () => cubit,
      seed: () => ShoppingListsState(lists: [shoppingList1]),
      act: (cubit) => cubit.update(
        shoppingList1.copyWith(name: 'Test!'),
      ),
      expect: () => [
        ShoppingListsState(
          lists: [shoppingList1.copyWith(name: 'Test!')],
        ),
      ],
    );

    group('selects a shopping list', () {
      blocTest<ShoppingListsCubit, ShoppingListsState>(
        'correctly',
        build: () => cubit,
        seed: () => ShoppingListsState(lists: [shoppingList1]),
        act: (cubit) => cubit.select(shoppingList1.id),
        expect: () => [
          ShoppingListsState(
            selectedId: shoppingList1.id,
            lists: [shoppingList1],
          ),
        ],
      );

      blocTest<ShoppingListsCubit, ShoppingListsState>(
        'with failure when its id is not in the lists',
        build: () => cubit,
        seed: () => ShoppingListsState(lists: [shoppingList1]),
        act: (cubit) => cubit.select('im not here'),
        errors: () => [isA<Exception>()],
      );
    });

    group('renames a shopping list', () {
      blocTest<ShoppingListsCubit, ShoppingListsState>(
        'correctly',
        build: () => cubit,
        seed: () => ShoppingListsState(lists: [shoppingList1]),
        act: (cubit) => cubit.rename(shoppingList1.id, 'new name'),
        expect: () => [
          ShoppingListsState(
            lists: [
              shoppingList1.copyWith(name: 'new name'),
            ],
          ),
        ],
      );

      blocTest<ShoppingListsCubit, ShoppingListsState>(
        'and trims its title correctly',
        build: () => cubit,
        seed: () => ShoppingListsState(lists: [shoppingList1]),
        act: (cubit) => cubit.rename(shoppingList1.id, '  spaces '),
        expect: () => [
          ShoppingListsState(
            lists: [shoppingList1.copyWith(name: 'spaces')],
          ),
        ],
      );
    });

    group('archives a shopping list', () {
      blocTest<ShoppingListsCubit, ShoppingListsState>(
        'correctly',
        build: () => cubit,
        seed: () => ShoppingListsState(lists: [shoppingList1]),
        act: (cubit) => cubit.archive(shoppingList1.id),
        expect: () => [
          ShoppingListsState(
            lists: [
              shoppingList1.copyWith(archivedAt: clock.now()),
            ],
          ),
        ],
      );

      blocTest<ShoppingListsCubit, ShoppingListsState>(
        'correctly and deselects it',
        build: () => cubit,
        seed: () => ShoppingListsState(
          selectedId: shoppingList1.id,
          lists: [shoppingList1],
        ),
        act: (cubit) => cubit.archive(shoppingList1.id),
        expect: () => [
          ShoppingListsState(
            lists: [
              shoppingList1.copyWith(archivedAt: clock.now()),
            ],
          ),
        ],
      );
    });

    blocTest<ShoppingListsCubit, ShoppingListsState>(
      'unarchives a shopping list correctly',
      build: () => cubit,
      seed: () => ShoppingListsState(lists: [
        shoppingList1.copyWith(archivedAt: clock.now()),
      ]),
      act: (cubit) => cubit.unarchive(shoppingList1.id),
      expect: () => [
        ShoppingListsState(
          lists: [
            shoppingList1.copyWith(archivedAt: null),
          ],
        ),
      ],
    );

    blocTest<ShoppingListsCubit, ShoppingListsState>(
      'removes a shopping list correctly',
      build: () => cubit,
      seed: () => ShoppingListsState(lists: [shoppingList1]),
      act: (cubit) => cubit.remove(shoppingList1.id),
      expect: () => [
        ShoppingListsState(lists: []),
      ],
    );
  });

  group('ShoppingListsState', () {
    group('selected', () {
      test('returns correct selected list', () {
        expect(
          ShoppingListsState(
            selectedId: shoppingList1.id,
            lists: [shoppingList1],
          ).selected,
          shoppingList1,
        );
      });

      test('returns null if no list is selected', () {
        expect(
          ShoppingListsState(
            lists: [shoppingList1],
          ).selected,
          null,
        );
      });
    });

    test('current returns current lists correctly', () {
      expect(
        ShoppingListsState(
          lists: [shoppingList1, shoppingList2],
        ).current,
        [shoppingList1],
      );
    });

    test('archived returns archived lists correctly', () {
      expect(
        ShoppingListsState(
          lists: [shoppingList1, shoppingList2],
        ).archived,
        [shoppingList2],
      );
    });
  });
}
