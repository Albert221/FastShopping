import 'package:fast_shopping/features/items/widgets/app_bar.dart';
import 'package:fast_shopping/features/items/widgets/shopping_list_bar.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ItemsAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const ShoppingListBar(),
    );
  }
}
