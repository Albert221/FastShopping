import 'package:animations/animations.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

import '../../rename_list_dialog.dart';
import '../no_current_lists_placeholder.dart';
import '../shopping_list_tile/shopping_list_tile.dart';
import 'shopping_lists_tab.dart';

class CurrentTab extends StatelessWidget {
  const CurrentTab({Key? key, required this.shoppingListsCubit})
      : super(key: key);

  final ShoppingListsCubit shoppingListsCubit;

  void _onListTap(BuildContext context, ShoppingList list) {
    shoppingListsCubit.select(list.id);
    Navigator.of(context).pop();
  }

  Future<void> _onRenameTap(BuildContext context, ShoppingList list) async {
    final newName = await showModal<String>(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(),
      builder: (context) => RenameListDialog(initialName: list.name),
    );

    if (newName == null) return;

    shoppingListsCubit.rename(list.id, newName);
  }

  void _onArchive(BuildContext context, ShoppingList list) {
    shoppingListsCubit.archive(list.id);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(S.of(context)!.shopping_list_archived_snackbar_message),
        action: SnackBarAction(
          label: S.of(context)!.shopping_list_archived_snackbar_undo,
          onPressed: () => shoppingListsCubit.unarchive(list.id),
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return shoppingListsCubit.state.current.isNotEmpty
        ? ShoppingListsTab(
            shoppingLists: shoppingListsCubit.state.current,
            itemBuilder: (list) => ShoppingListTile(
              shoppingList: list,
              current: shoppingListsCubit.state.selectedId == list.id,
              onTap: () => _onListTap(context, list),
              onRenameTap: () => _onRenameTap(context, list),
              onArchiveTap: () => _onArchive(context, list),
            ),
          )
        : const CurrentTabPlaceholder();
  }
}
