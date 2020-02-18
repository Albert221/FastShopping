import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'persister.g.dart';

class LoadData {}

class LoadedData {
  final FastShoppingState state;

  LoadedData(this.state);
}

Middleware<FastShoppingState> persisterMiddleware() {
  const v1DataKey = 'DATA';
  const dataKey = 'V2-DATA';
  final sharedPrefs = SharedPreferences.getInstance();

  return (Store<FastShoppingState> store, action, NextDispatcher next) {
    next(action);

    if (action is LoadData) {
      sharedPrefs.then((prefs) {
        // Check for data from v1.x version of the app
        if (prefs.containsKey(v1DataKey)) {
          final json = prefs.getString(v1DataKey);
          final migratedState = _migrateV1ToV2(json);

          store.dispatch(LoadedData(migratedState));
        } else if (prefs.containsKey(dataKey)) {
          // Load data
          final json = prefs.getString(dataKey);
          final loadedState = _serializers.deserializeWith(
            FastShoppingState.serializer,
            jsonDecode(json),
          );

          store.dispatch(LoadedData(loadedState));
        }
      });
    } else {
      // Save data
      final json = jsonEncode(
        _serializers.serializeWith(
          FastShoppingState.serializer,
          store.state,
        ),
      );

      sharedPrefs.then((prefs) => prefs.setString(dataKey, json));
    }
  };
}

@SerializersFor(const [FastShoppingState])
final Serializers _serializers =
    (_$_serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

FastShoppingState _migrateV1ToV2(String json) {
  final purchases = jsonDecode(json) as List<dynamic>;

  final list = ShoppingList(
    (b) => b
      ..id = Uuid().v4()
      ..name = 'list_from_old_version'.i18n,
  );

  final items = purchases.map((purchase) {
    purchase = purchase as Map<String, dynamic>;
    final done = purchase['purchased'] as bool;

    return Item(
      (b) => b
        ..title = purchase['name'] as String
        ..shoppingListId = list.id
        ..done = done
        ..doneAt = done ? DateTime.now().toUtc() : null,
    );
  });

  return FastShoppingState(
    (b) => b
      ..currentListId = list.id
      ..lists = BuiltList<ShoppingList>([list]).toBuilder()
      ..items = BuiltList<Item>(items).toBuilder(),
  );
}
