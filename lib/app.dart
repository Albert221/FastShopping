import 'package:fast_shopping/features/items/items_screen.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FastShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FastShoppingTheme.light(),
      home: ItemsScreen(),
      // Localization stuff
      onGenerateTitle: (context) => S.of(context).app_title,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
