import 'package:fast_shopping_bloc/fast_shopping_bloc.dart' as fsb;
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsRepository extends fsb.AppSettingsRepository {
  static const _prefix = 'v3';
  static const _shoppingListsModeKey = '$_prefix-shopping-lists-mode';
  static const _darkModeKey = '$_prefix-dark-mode';
  static const _itemsLayoutKey = '$_prefix-items-layout';
  static const _moveDoneToEndKey = '$_prefix-move-done-to-end';

  final _sharedPrefs = SharedPreferences.getInstance();

  @override
  Future<fsb.ShoppingListsMode> getShoppingListsMode() async {
    final prefs = await _sharedPrefs;
    final value = prefs.getInt(_shoppingListsModeKey);
    return value != null ? fsb.ShoppingListsMode.values[value] : null;
  }

  @override
  Future<void> saveShoppingListsMode(
    fsb.ShoppingListsMode shoppingListsMode,
  ) async {
    final prefs = await _sharedPrefs;
    return prefs.setInt(_shoppingListsModeKey, shoppingListsMode.index);
  }

  @override
  Future<fsb.DarkMode> getDarkMode() async {
    final prefs = await _sharedPrefs;
    final value = prefs.getInt(_darkModeKey);
    return value != null ? fsb.DarkMode.values[value] : null;
  }

  @override
  Future<void> saveDarkMode(fsb.DarkMode darkMode) async {
    final prefs = await _sharedPrefs;
    return prefs.setInt(_darkModeKey, darkMode.index);
  }

  @override
  Future<fsb.ItemsLayout> getItemsLayout() async {
    final prefs = await _sharedPrefs;
    final value = prefs.getInt(_itemsLayoutKey);
    return value != null ? fsb.ItemsLayout.values[value] : null;
  }

  @override
  Future<void> saveItemsLayout(fsb.ItemsLayout itemsLayout) async {
    final prefs = await _sharedPrefs;
    return prefs.setInt(_itemsLayoutKey, itemsLayout.index);
  }

  @override
  Future<bool> getMoveDoneToEnd() async {
    final prefs = await _sharedPrefs;
    return prefs.getBool(_moveDoneToEndKey);
  }

  @override
  Future<void> saveMoveDoneToEnd(bool moveDoneToEnd) async {
    final prefs = await _sharedPrefs;
    return prefs.setBool(_moveDoneToEndKey, moveDoneToEnd);
  }
}
