import 'package:fast_shopping_bloc/fast_shopping_bloc.dart' as fsb;
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsRepository extends fsb.AppSettingsRepository {
  static const _prefix = 'v3';
  static const _shoppingListsModeKey = '$_prefix-shopping-lists-mode';
  static const _darkThemeKey = '$_prefix-dark-theme';
  static const _moveDoneToEndKey = '$_prefix-move-done-to-end';

  final _sharedPrefs = SharedPreferences.getInstance();

  @override
  Future<fsb.ShoppingListsMode?> getShoppingListsMode() async {
    final prefs = await _sharedPrefs;
    final value = prefs.getInt(_shoppingListsModeKey);
    return value != null ? fsb.ShoppingListsMode.values[value] : null;
  }

  @override
  Future<void> saveShoppingListsMode(
    fsb.ShoppingListsMode shoppingListsMode,
  ) async {
    final prefs = await _sharedPrefs;
    await prefs.setInt(_shoppingListsModeKey, shoppingListsMode.index);
  }

  @override
  Future<fsb.DarkTheme?> getDarkTheme() async {
    final prefs = await _sharedPrefs;
    final value = prefs.getInt(_darkThemeKey);
    return value != null ? fsb.DarkTheme.values[value] : null;
  }

  @override
  Future<void> saveDarkTheme(fsb.DarkTheme darkTheme) async {
    final prefs = await _sharedPrefs;
    await prefs.setInt(_darkThemeKey, darkTheme.index);
  }

  @override
  Future<bool?> getMoveDoneToEnd() async {
    final prefs = await _sharedPrefs;
    return prefs.getBool(_moveDoneToEndKey);
  }

  @override
  Future<void> saveMoveDoneToEnd(bool moveDoneToEnd) async {
    final prefs = await _sharedPrefs;
    await prefs.setBool(_moveDoneToEndKey, moveDoneToEnd);
  }
}
