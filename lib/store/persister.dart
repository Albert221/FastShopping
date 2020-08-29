import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'persister.g.dart';

class LoadData {}

class LoadedData {
  LoadedData(this.state);

  final FastShoppingState state;
}

Middleware<FastShoppingState> persisterMiddleware() {
  const dataKey = 'V2-DATA';
  final sharedPrefs = SharedPreferences.getInstance();

  return (Store<FastShoppingState> store, action, NextDispatcher next) {
    next(action);

    if (action is LoadData) {
      sharedPrefs.then((prefs) {
        if (prefs.containsKey(dataKey)) {
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

@SerializersFor([FastShoppingState])
final Serializers _serializers =
    (_$_serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
