import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';

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
    return ImplicitlyAnimatedList<ShoppingList>(
      items: shoppingLists,
      areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, itemAnimation, item, index) => SizeFadeTransition(
        curve: standardEasing,
        animation: itemAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: itemBuilder(item),
        ),
      ),
    );
  }
}
