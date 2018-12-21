import 'package:fast_shopping/localization.dart';
import 'package:fast_shopping/model/shopping_list_model.dart';
import 'package:fast_shopping/persistor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fast_shopping/ui/shopping_list_page.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(ShoppingListApp());

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final persistor = Persistor();
    final model =
        ShoppingListModel(onSave: (model) => persistor.save(model.purchases));

    persistor.load().then((data) => model.import(data));

    return ScopedModel<ShoppingListModel>(
        model: model,
        child: MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('pl', 'PL'),
              const Locale('en', 'US')
            ],
            theme: ThemeData(
                primarySwatch: Colors.amber, backgroundColor: Colors.white),
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context).appTitle,
            home: ShoppingListPage()));
  }
}
