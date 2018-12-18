import 'package:flutter/material.dart';
import 'package:shopping_list/ui/shopping_list_page.dart';

void main() => runApp(ShoppingListApp());

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lista zakupów',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.amber, backgroundColor: Colors.white),
        home: ShoppingListPage());
  }
}
