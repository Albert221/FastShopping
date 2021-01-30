import 'dart:convert';

import 'package:fast_shopping_bloc/fast_shopping_bloc.dart' as fsb;
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingListRepository extends fsb.ShoppingListRepository {
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
  Future<List<fsb.ShoppingList>> getLists() async {
    final prefs = await _sharedPrefs;
    final json = prefs.getString(_listsKey);
    if (json == null) return [];

    final data = List<Map<String, dynamic>>.from(jsonDecode(json) as List);

    return data.map((list) => fsb.ShoppingList.fromJson(list)).toList();
  }

  @override
  Future<void> saveLists(List<fsb.ShoppingList> lists) async {
    final prefs = await _sharedPrefs;
    final json = jsonEncode(lists.map((list) => list.toJson()).toList());

    return prefs.setString(_listsKey, json);
  }
}
