import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/screens/screens.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FastShoppingApp extends StatelessWidget {
  final Store<FastShoppingState> store;

  const FastShoppingApp({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // I don't like how I18nBuilder works now,
    // will probably refactor it sometime.

    return I18nBuilder(
      placeholder: Container(color: Colors.white),
      builder: (_) => StoreProvider<FastShoppingState>(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (_) => 'Fast Shopping'.i18n,
          home: MainScreen(),
          theme: FastShoppingTheme.light(),
        ),
      ),
    );
  }
}
