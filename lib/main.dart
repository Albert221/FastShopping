import 'package:built_collection/built_collection.dart';
import 'package:fast_shopping/app.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'models/models.dart';

void main() {
  final store = Store<BuiltList<Item>>(
    itemsReducer,
    middleware: [thunkMiddleware],
    initialState: _initialState,
  );

  runApp(FastShoppingApp(store: store));
}

final _initialState = BuiltList([
  Item((b) => b..title = 'Herbatniki duża paczka'),
  Item((b) => b..title = '3x bita śmietana (proszek)'),
  Item((b) => b..title = '0,5l śmietany 30% karton'),
  Item((b) => b
    ..title = 'Krem karpatka proszek'
    ..done = true
    ..doneAt = DateTime.now()),
  Item((b) => b
    ..title = 'Masa kajmakowa/krówkowa (puszka) '
        'albo mleko skondensowane jak nie będzie'),
  Item((b) => b..title = 'Kapusta czerwona 2x średnie'),
  Item((b) => b..title = '6 cebul czerwonych'),
]);
