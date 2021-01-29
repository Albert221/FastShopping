import 'package:bloc_test/bloc_test.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  group('AppSettingsCubit', () {
    AppSettingsRepository appSettingsRepository;
    AppSettingsCubit cubit;
    setUp(() {
      appSettingsRepository = MockAppSettingsRepository();
      cubit = AppSettingsCubit(appSettingsRepository);
    });
    tearDown(() => cubit.close());

    test('has correct initial state', () {
      expect(cubit.state, const AppSettings());
    });

    blocTest<AppSettingsCubit, AppSettings>(
      'load loads settings correctly',
      build: () {
        when(appSettingsRepository.getShoppingListsMode())
            .thenAnswer((_) async => ShoppingListsMode.single);
        when(appSettingsRepository.getDarkMode()).thenAnswer((_) async => null);
        when(appSettingsRepository.getItemsLayout())
            .thenAnswer((_) async => null);
        when(appSettingsRepository.getMoveDoneToEnd())
            .thenAnswer((_) async => false);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: const [
        AppSettings(
          shoppingListsMode: ShoppingListsMode.single,
          moveDoneToEnd: false,
        ),
      ],
      verify: (cubit) {
        verify(appSettingsRepository.getShoppingListsMode()).called(1);
        verify(appSettingsRepository.getDarkMode()).called(1);
        verify(appSettingsRepository.getItemsLayout()).called(1);
        verify(appSettingsRepository.getMoveDoneToEnd()).called(1);
      },
    );

    blocTest<AppSettingsCubit, AppSettings>(
      'sets shopping list mode correctly',
      build: () => cubit,
      act: (cubit) => cubit.setShoppingListsMode(ShoppingListsMode.single),
      expect: const [
        AppSettings(shoppingListsMode: ShoppingListsMode.single),
      ],
      verify: (cubit) => verify(
        appSettingsRepository.setShoppingListsMode(ShoppingListsMode.single),
      ).called(1),
    );

    blocTest<AppSettingsCubit, AppSettings>(
      'sets dark mode correctly',
      build: () => cubit,
      act: (cubit) => cubit.setDarkMode(DarkMode.enabled),
      expect: const [
        AppSettings(darkMode: DarkMode.enabled),
      ],
      verify: (cubit) => verify(
        appSettingsRepository.setDarkMode(DarkMode.enabled),
      ).called(1),
    );

    blocTest<AppSettingsCubit, AppSettings>(
      'sets items layout correctly',
      build: () => cubit,
      act: (cubit) => cubit.setItemsLayout(ItemsLayout.dense),
      expect: const [
        AppSettings(itemsLayout: ItemsLayout.dense),
      ],
      verify: (cubit) => verify(
        appSettingsRepository.setItemsLayout(ItemsLayout.dense),
      ).called(1),
    );

    blocTest<AppSettingsCubit, AppSettings>(
      'sets move done to ended correctly',
      build: () => cubit,
      act: (cubit) => cubit.setMoveDoneToEnd(false),
      expect: const [
        AppSettings(moveDoneToEnd: false),
      ],
      verify: (cubit) => verify(
        appSettingsRepository.setMoveDoneToEnd(false),
      ).called(1),
    );
  });
}
