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
      _settingsRepository.getDarkTheme(),
      _settingsRepository.getMoveDoneToEnd(),
    ]);

    final shoppingListsMode = settings[0] as ShoppingListsMode?;
    final darkTheme = settings[1] as DarkTheme?;
    final moveDoneToEnd = settings[2] as bool?;

    emit(state.copyWith(
      shoppingListsMode: shoppingListsMode ?? state.shoppingListsMode,
      darkTheme: darkTheme ?? state.darkTheme,
      moveDoneToEnd: moveDoneToEnd ?? state.moveDoneToEnd,
    ));
  }

  Future<void> setShoppingListsMode(ShoppingListsMode shoppingListsMode) async {
    await _settingsRepository.saveShoppingListsMode(shoppingListsMode);
    emit(state.copyWith(shoppingListsMode: shoppingListsMode));
  }

  Future<void> setDarkTheme(DarkTheme darkTheme) async {
    await _settingsRepository.saveDarkTheme(darkTheme);
    emit(state.copyWith(darkTheme: darkTheme));
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setMoveDoneToEnd(bool moveDoneToEnd) async {
    await _settingsRepository.saveMoveDoneToEnd(moveDoneToEnd);
    emit(state.copyWith(moveDoneToEnd: moveDoneToEnd));
  }
}

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(ShoppingListsMode.multiple) ShoppingListsMode shoppingListsMode,
    @Default(DarkTheme.system) DarkTheme darkTheme,
    @Default(false) bool moveDoneToEnd,
  }) = _AppSettings;
}
