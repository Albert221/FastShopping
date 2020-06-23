import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/screens/screens.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FastShoppingApp extends StatefulWidget {
  final Store<FastShoppingState> store;

  const FastShoppingApp({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  _FastShoppingAppState createState() => _FastShoppingAppState();
}

class _FastShoppingAppState extends State<FastShoppingApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<FastShoppingState>(
      store: widget.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => S.of(context).app_title,
        home: MainScreen(),
        theme: FastShoppingTheme.light(),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
