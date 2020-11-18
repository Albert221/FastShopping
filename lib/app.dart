import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/screens/screens.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:fast_shopping/theme.dart';
import 'package:fast_shopping/utils/mocked_state_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FastShoppingApp extends StatefulWidget {
  const FastShoppingApp({
    Key key,
    @required this.store,
    this.screenshottingLocale,
  }) : super(key: key);

  final Store<FastShoppingState> store;

  /// `screenshottingLocale` is a locale that overrides the system one. When not
  /// null, fills store with mocked data.
  final Locale screenshottingLocale;

  @override
  _FastShoppingAppState createState() => _FastShoppingAppState();
}

class _FastShoppingAppState extends State<FastShoppingApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<FastShoppingState>(
      store: widget.store,
      child: MaterialApp(
        key: widget.screenshottingLocale != null ? UniqueKey() : null,
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) {
          if (widget.screenshottingLocale != null) {
            StoreProvider.of<FastShoppingState>(context)
                .dispatch(LoadedData(getMockedState(context)));
          }

          return S.of(context).app_title;
        },
        home: MainScreen(),
        theme: FastShoppingTheme.light(),
        locale: widget.screenshottingLocale,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
