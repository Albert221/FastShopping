import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:fast_shopping_bloc/shopping_lists.dart';
import 'package:flutter/material.dart';

import '../shopping_list_tile/shopping_list_tile.dart';
import 'shopping_lists_tab.dart';

class ArchivedTab extends StatelessWidget {
  const ArchivedTab({Key key, @required this.shoppingListsCubit})
      : super(key: key);

  final ShoppingListsCubit shoppingListsCubit;

  void _onUnarchive(BuildContext context, ShoppingList list) {
    shoppingListsCubit.unarchive(list.id);

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(S.of(context).shopping_list_unarchived_snackbar_message),
      ));
  }

  void _onDelete(BuildContext context, ShoppingList list) {
    shoppingListsCubit.remove(list.id);

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(S.of(context).shopping_list_unarchived_snackbar_message),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return ShoppingListsTab(
      shoppingLists: shoppingListsCubit.state.archived,
      itemBuilder: (list) => ShoppingListTile(
        shoppingList: list,
        current: shoppingListsCubit.state.selectedId == list.id,
        onTap: () => shoppingListsCubit.select(list.id),
        onUnarchiveTap: () => _onUnarchive(context, list),
        // TODO(Albert221): Add confirmation dialog
        onDeleteTap: () => _onDelete(context, list),
      ),
    );
  }
}
