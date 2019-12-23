import 'package:fast_shopping/screens/screens.dart';
import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';

class FastShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fast Shopping',
      home: MainScreen(),
      theme: FastShoppingTheme.light(),
    );
  }
}
