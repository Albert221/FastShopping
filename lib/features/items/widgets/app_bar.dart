import 'package:fast_shopping/features/settings/settings_screen.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';

import 'app_logo.dart';

typedef _ContextCallback = void Function(BuildContext);

enum _MenuItem { shareItems, archiveList, undoneAll, removeAllDone, settings }

class ItemsAppBar extends StatelessWidget implements PreferredSizeWidget {

  const ItemsAppBar({
    Key? key,
    required this.shoppingListsMode,
    this.onShareItems,
    this.onArchiveList,
    this.onUndoneAll,
    this.onRemoveAllDone,
  }) : super(key: key);

  final ShoppingListsMode shoppingListsMode;
  final _ContextCallback? onShareItems;
  final _ContextCallback? onArchiveList;
  final _ContextCallback? onUndoneAll;
  final _ContextCallback? onRemoveAllDone;

  void _onMenuItemSelected(BuildContext context, _MenuItem item) {
    switch (item) {
      case _MenuItem.shareItems:
        onShareItems?.call(context);
        break;
      case _MenuItem.archiveList:
        onArchiveList?.call(context);
        break;
      case _MenuItem.undoneAll:
        onUndoneAll?.call(context);
        break;
      case _MenuItem.removeAllDone:
        onRemoveAllDone?.call(context);
        break;
      case _MenuItem.settings:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsScreen(),
        ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const AppLogo(),
      actions: [
        PopupMenuButton<_MenuItem>(
          key: const ValueKey('menu'),
          onSelected: (item) => _onMenuItemSelected(context, item),
          itemBuilder: (context) => [
            _PopupMenuItem(
              value: _MenuItem.shareItems,
              enabled: onArchiveList != null,
              icon: const Icon(Icons.ios_share),
              label: Text(S.of(context)!.menu_share_list),
            ),
            const PopupMenuDivider(),
            if (shoppingListsMode == ShoppingListsMode.multiple)
              _PopupMenuItem(
                value: _MenuItem.archiveList,
                enabled: onArchiveList != null,
                icon: const Icon(Icons.archive),
                label: Text(S.of(context)!.menu_archive_list),
              )
            else ...[
              _PopupMenuItem(
                value: _MenuItem.undoneAll,
                enabled: onUndoneAll != null,
                icon: const Icon(Icons.remove_done),
                label: Text(S.of(context)!.menu_undone_all_done),
              ),
              _PopupMenuItem(
                value: _MenuItem.removeAllDone,
                enabled: onRemoveAllDone != null,
                icon: const Icon(Icons.delete),
                label: Text(S.of(context)!.menu_remove_all_done),
              ),
            ],
            const PopupMenuDivider(),
            _PopupMenuItem(
              key: const ValueKey('settings'),
              value: _MenuItem.settings,
              icon: const Icon(Icons.settings),
              label: Text(S.of(context)!.settings_title),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PopupMenuItem<T> extends PopupMenuItem<T> {
  _PopupMenuItem({
    Key? key,
    required T value,
    bool enabled = true,
    Widget? icon,
    required Widget label,
  }) : super(
          key: key,
          value: value,
          enabled: enabled,
          child: Row(
            children: [
              if (icon != null) ...[icon, const SizedBox(width: 16)],
              label,
            ],
          ),
        );
}
