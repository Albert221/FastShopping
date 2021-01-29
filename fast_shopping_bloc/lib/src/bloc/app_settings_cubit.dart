import 'package:bloc/bloc.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_cubit.freezed.dart';

class AppSettingsCubit extends Cubit<AppSettings> {
  AppSettingsCubit() : super(const AppSettings());

  Future<void> load() async {
    // TODO: Load
  }

  Future<void> setShoppingListsMode(ShoppingListsMode shoppingListsMode) async {
    // TODO: Persist
    emit(state.copyWith(shoppingListsMode: shoppingListsMode));
  }

  Future<void> setDarkMode(DarkMode darkMode) async {
    // TODO: Persist
    emit(state.copyWith(darkMode: darkMode));
  }

  Future<void> setItemsLayout(ItemsLayout itemsLayout) async {
    // TODO: Persist
    emit(state.copyWith(itemsLayout: itemsLayout));
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setMoveDoneToEnd(bool moveDoneToEnd) async {
    // TODO: Persist
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
