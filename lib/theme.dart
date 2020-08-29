import 'package:flutter/material.dart';

class FastShoppingTheme {
  static ThemeData light() {
    const primary = Color(0xFFFFC107);

    return ThemeData(
      primaryColor: primary,
      accentColor: primary,
      scaffoldBackgroundColor: const Color(0xFFF1F1F1),
      appBarTheme: const AppBarTheme(
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      bottomAppBarColor: primary,
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
