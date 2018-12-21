import 'package:fast_shopping/model/purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Persistor {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const String KEY = 'DATA';

  Future<List<Purchase>> load() async {
    var prefs = await _prefs;

    if (prefs.getKeys().contains(KEY)) {
      final deserialized = json.decode(prefs.getString(KEY)) as List<dynamic>;
      return deserialized.map((obj) => Purchase.fromJson(obj)).toList();
    }

    return [];
  }

  void save(List<Purchase> data) async {
    var serialized = json.encode(data);

    var prefs = await _prefs;
    prefs.setString(KEY, serialized);
  }
}