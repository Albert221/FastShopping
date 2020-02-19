import 'package:devicelocale/devicelocale.dart';
import 'package:fast_shopping/app.dart';
import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FastShoppingI18n().init(await Devicelocale.currentLocale);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final store = _setupStore();

  runApp(FastShoppingApp(
    store: store,
    onHotReload: () async {
      // Somehow you still have to Hot Reload twice after
      // changing messages files, but that's still more convenient
      // than Hot Restarting the app.
      FastShoppingI18n().init(await Devicelocale.currentLocale);
    },
  ));
}

Store<FastShoppingState> _setupStore() {
  return Store<FastShoppingState>(
    rootReducer,
    middleware: [
      thunkMiddleware,
      persisterMiddleware(),
    ],
    initialState: FastShoppingState(),
  )..dispatch(LoadData());
}
