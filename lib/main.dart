import 'package:built_collection/built_collection.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:fast_shopping/app.dart';
import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:uuid/uuid.dart';
import 'models/models.dart';

void main() async {
  final store = _setupStore();

  WidgetsFlutterBinding.ensureInitialized();
  final langs = await Devicelocale.preferredLanguages;
  await FastShoppingI18n().init(Set<String>.from(langs));

  runApp(FastShoppingApp(store: store));
}

Store<FastShoppingState> _setupStore() {
  return Store<FastShoppingState>(
    rootReducer,
    middleware: [
      thunkMiddleware,
    ],
    // initialState: FastShoppingState(),
    initialState: _initialState,
  )..dispatch(Boot());
}

final _initialListId = Uuid().v4();
final _initialState = FastShoppingState(
  (b) => b
    ..currentListId = _initialListId
    ..lists = BuiltList<ShoppingList>([
      ShoppingList(
        (b) => b
          ..id = _initialListId
          ..name = 'My shopping list',
      )
    ]).toBuilder()
    ..items = BuiltList<Item>([
      Item((b) => b
        ..title = 'Herbatniki duża paczka'
        ..shoppingListId = _initialListId),
      Item((b) => b
        ..title = '3x bita śmietana (proszek)'
        ..shoppingListId = _initialListId),
      Item((b) => b
        ..title = '0,5l śmietany 30% karton'
        ..shoppingListId = _initialListId),
      Item((b) => b
        ..title = 'Krem karpatka proszek'
        ..done = true
        ..doneAt = DateTime.now()
        ..shoppingListId = _initialListId),
      Item((b) => b
        ..title = 'Masa kajmakowa/krówkowa (puszka) '
            'albo mleko skondensowane jak nie będzie'
        ..shoppingListId = _initialListId),
      Item((b) => b
        ..title = 'Kapusta czerwona 2x średnie'
        ..shoppingListId = _initialListId),
      Item((b) => b
        ..title = '6 cebul czerwonych'
        ..shoppingListId = _initialListId),
    ]).toBuilder(),
);
