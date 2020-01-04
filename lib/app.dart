import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/screens/screens.dart';
import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';

class FastShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return I18nBuilder(
      placeholder: Container(
        color: Colors.white,
      ),
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (_) => 'Fast Shopping'.i18n,
        home: MainScreen(),
        theme: FastShoppingTheme.light(),
      ),
    );
  }
}
