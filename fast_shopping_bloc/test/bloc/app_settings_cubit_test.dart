import 'package:bloc_test/bloc_test.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  group('AppSettingsCubit', () {
    late AppSettingsRepository appSettingsRepository;
    late AppSettingsCubit cubit;
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
        when(appSettingsRepository.getDarkTheme())
            .thenAnswer((_) async => null);
        when(appSettingsRepository.getMoveDoneToEnd())
            .thenAnswer((_) async => false);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => const [
        AppSettings(
          shoppingListsMode: ShoppingListsMode.single,
          moveDoneToEnd: false,
        ),
      ],
      verify: (cubit) {
        verify(appSettingsRepository.getShoppingListsMode()).called(1);
        verify(appSettingsRepository.getDarkTheme()).called(1);
        verify(appSettingsRepository.getMoveDoneToEnd()).called(1);
      },
    );

    blocTest<AppSettingsCubit, AppSettings>(
      'sets shopping list mode correctly',
      build: () => cubit,
      act: (cubit) => cubit.setShoppingListsMode(ShoppingListsMode.single),
      expect: () => const [
        AppSettings(shoppingListsMode: ShoppingListsMode.single),
      ],
      verify: (cubit) => verify(
        appSettingsRepository.saveShoppingListsMode(ShoppingListsMode.single),
      ).called(1),
    );

    blocTest<AppSettingsCubit, AppSettings>(
      'sets dark mode correctly',
      build: () => cubit,
      act: (cubit) => cubit.setDarkTheme(DarkTheme.enabled),
      expect: () => const [
        AppSettings(darkTheme: DarkTheme.enabled),
      ],
      verify: (cubit) => verify(
        appSettingsRepository.saveDarkTheme(DarkTheme.enabled),
      ).called(1),
    );

    blocTest<AppSettingsCubit, AppSettings>(
      'sets move done to ended correctly',
      build: () => cubit,
      act: (cubit) => cubit.setMoveDoneToEnd(false),
      expect: () => const [
        AppSettings(moveDoneToEnd: false),
      ],
      verify: (cubit) => verify(
        appSettingsRepository.saveMoveDoneToEnd(false),
      ).called(1),
    );
  });
}
