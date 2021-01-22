import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';

import 'shopping_list_tile.dart';

class ActionsMenu extends StatelessWidget {
  const ActionsMenu({
    Key key,
    this.onRenameTap,
    this.onArchiveTap,
    this.onUnarchiveTap,
    this.onDeleteTap,
  }) : super(key: key);

  final VoidCallback onRenameTap;
  final VoidCallback onArchiveTap;
  final VoidCallback onUnarchiveTap;
  final VoidCallback onDeleteTap;

  void _onActionSelected(BuildContext context, ShoppingListActions action) {
    switch (action) {
      case ShoppingListActions.rename:
        return onRenameTap();
      case ShoppingListActions.archive:
        return onArchiveTap();
      case ShoppingListActions.unarchive:
        return onUnarchiveTap();
      case ShoppingListActions.delete:
        return onDeleteTap();
    }
  }

  bool get _actionsAvailable =>
      (onRenameTap ?? onArchiveTap ?? onUnarchiveTap ?? onDeleteTap) != null;

  @override
  Widget build(BuildContext context) {
    return _actionsAvailable
        ? PopupMenuButton<ShoppingListActions>(
            onSelected: (action) => _onActionSelected(context, action),
            itemBuilder: (context) => [
              if (onRenameTap != null)
                PopupMenuItem(
                  value: ShoppingListActions.rename,
                  child: Row(
                    children: [
                      const Icon(Icons.edit),
                      const SizedBox(width: 16),
                      Text(S.of(context).list_item_action_rename),
                    ],
                  ),
                ),
              if (onArchiveTap != null)
                PopupMenuItem(
                  value: ShoppingListActions.archive,
                  child: Row(
                    children: [
                      const Icon(Icons.archive),
                      const SizedBox(width: 16),
                      Text(S.of(context).list_item_action_archive),
                    ],
                  ),
                ),
              if (onUnarchiveTap != null)
                PopupMenuItem(
                  value: ShoppingListActions.unarchive,
                  child: Row(
                    children: [
                      const Icon(Icons.unarchive),
                      const SizedBox(width: 16),
                      Text(S.of(context).list_item_action_unarchive),
                    ],
                  ),
                ),
              if (onDeleteTap != null)
                PopupMenuItem(
                  value: ShoppingListActions.delete,
                  child: Row(
                    children: [
                      const Icon(Icons.delete),
                      const SizedBox(width: 16),
                      Text(S.of(context).list_item_action_delete),
                    ],
                  ),
                ),
            ],
          )
        : const SizedBox();
  }
}
