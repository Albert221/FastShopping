import 'package:bloc/bloc.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_cubit.freezed.dart';

class AppSettingsCubit extends Cubit<AppSettings> {
  AppSettingsCubit(this._settingsRepository) : super(const AppSettings());

  final AppSettingsRepository _settingsRepository;

  Future<void> load() async {
    final settings = await Future.wait([
      _settingsRepository.getShoppingListsMode(),
      _settingsRepository.getDarkMode(),
      _settingsRepository.getItemsLayout(),
      _settingsRepository.getMoveDoneToEnd(),
    ]);

    final shoppingListsMode = settings[0] as ShoppingListsMode;
    final darkMode = settings[1] as DarkMode;
    final itemsLayout = settings[2] as ItemsLayout;
    final moveDoneToEnd = settings[3] as bool;

    emit(state.copyWith(
      shoppingListsMode: shoppingListsMode ?? state.shoppingListsMode,
      darkMode: darkMode ?? state.darkMode,
      itemsLayout: itemsLayout ?? state.itemsLayout,
      moveDoneToEnd: moveDoneToEnd ?? state.moveDoneToEnd,
    ));
  }

  Future<void> setShoppingListsMode(ShoppingListsMode shoppingListsMode) async {
    await _settingsRepository.saveShoppingListsMode(shoppingListsMode);
    emit(state.copyWith(shoppingListsMode: shoppingListsMode));
  }

  Future<void> setDarkMode(DarkMode darkMode) async {
    await _settingsRepository.saveDarkMode(darkMode);
    emit(state.copyWith(darkMode: darkMode));
  }

  Future<void> setItemsLayout(ItemsLayout itemsLayout) async {
    await _settingsRepository.saveItemsLayout(itemsLayout);
    emit(state.copyWith(itemsLayout: itemsLayout));
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setMoveDoneToEnd(bool moveDoneToEnd) async {
    await _settingsRepository.saveMoveDoneToEnd(moveDoneToEnd);
    emit(state.copyWith(moveDoneToEnd: moveDoneToEnd));
  }
}

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(ShoppingListsMode.multiple) ShoppingListsMode shoppingListsMode,
    @Default(DarkMode.system) DarkMode darkMode,
    @Default(ItemsLayout.comfortable) ItemsLayout itemsLayout,
    @Default(true) bool moveDoneToEnd,
  }) = _AppSettings;
}
