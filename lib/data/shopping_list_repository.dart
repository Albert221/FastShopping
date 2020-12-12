import 'dart:convert';

import 'package:fast_shopping_bloc/data.dart' as data;
import 'package:fast_shopping_bloc/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingListRepository extends data.ShoppingListRepository {
  static const _prefix = 'v3';
  static const _selectedListIdKey = '$_prefix-selected-list-id';
  static const _listsKey = '$_prefix-lists';

  final _sharedPrefs = SharedPreferences.getInstance();

  @override
  Future<String> getSelectedListId() async {
    final prefs = await _sharedPrefs;
    return prefs.getString(_selectedListIdKey);
  }

  @override
  Future<void> saveSelectedListId(String id) async {
    final prefs = await _sharedPrefs;
    return prefs.setString(_selectedListIdKey, id);
  }

  @override
  Future<List<ShoppingList>> getLists() async {
    final prefs = await _sharedPrefs;
    final json = List<Map<String, dynamic>>.from(
      jsonDecode(prefs.getString(_listsKey)) as List,
    );

    return json.map((list) => ShoppingList.fromJson(list)).toList();
  }

  @override
  Future<void> saveLists(List<ShoppingList> lists) async {
    final prefs = await _sharedPrefs;
    final json = jsonEncode(lists.map((list) => list.toJson()).toList());

    return prefs.setString(_listsKey, json);
  }
}
