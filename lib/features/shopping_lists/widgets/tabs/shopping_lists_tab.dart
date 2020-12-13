import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter/material.dart';

class ShoppingListsTab extends StatelessWidget {
  const ShoppingListsTab({
    Key key,
    @required this.shoppingLists,
    @required this.itemBuilder,
  }) : super(key: key);

  final List<ShoppingList> shoppingLists;
  final Widget Function(ShoppingList) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: shoppingLists.length,
      itemBuilder: (context, i) {
        final shoppingList = shoppingLists[i];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: itemBuilder(shoppingList),
        );
      },
    );
  }
}
