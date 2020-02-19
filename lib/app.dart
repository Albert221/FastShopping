import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/screens/screens.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FastShoppingApp extends StatefulWidget {
  final Store<FastShoppingState> store;
  final VoidCallback onHotReload;

  const FastShoppingApp({
    Key key,
    @required this.store,
    this.onHotReload,
  }) : super(key: key);

  @override
  _FastShoppingAppState createState() => _FastShoppingAppState();
}

class _FastShoppingAppState extends State<FastShoppingApp> {
  @override
  void reassemble() {
    super.reassemble();
    widget.onHotReload?.call();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<FastShoppingState>(
      store: widget.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (_) => 'Fast Shopping'.i18n,
        home: MainScreen(),
        theme: FastShoppingTheme.light(),
      ),
    );
  }
}
