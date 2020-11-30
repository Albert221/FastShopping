import 'package:fast_shopping_bloc/shopping_lists.dart';
import 'package:flutter/material.dart';

import '../shopping_list_tile/shopping_list_tile.dart';
import 'shopping_lists_tab.dart';

class ArchivedTab extends StatelessWidget {
  const ArchivedTab({Key key, @required this.shoppingListsCubit})
      : super(key: key);

  final ShoppingListsCubit shoppingListsCubit;

  @override
  Widget build(BuildContext context) {
    return ShoppingListsTab(
      shoppingLists: shoppingListsCubit.state.archived,
      itemBuilder: (list) => ShoppingListTile(
        shoppingList: list,
        current: shoppingListsCubit.state.selectedId == list.id,
        onTap: () => shoppingListsCubit.select(list.id),
        onUnarchiveTap: () => shoppingListsCubit.unarchive(list.id),
        // TODO(Albert221): Add confirmation dialog
        onDeleteTap: () => shoppingListsCubit.remove(list.id),
      ),
    );
  }
}
