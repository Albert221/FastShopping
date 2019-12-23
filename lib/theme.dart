import 'package:flutter/material.dart';

class FastShoppingTheme {
  static ThemeData light() {
    const primary = const Color(0xFFFFC107);

    return ThemeData(
      primaryColor: primary,
      accentColor: primary,
      scaffoldBackgroundColor: Color(0xFFF1F1F1),
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      bottomAppBarColor: primary,
      textTheme: TextTheme(
        body1: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
