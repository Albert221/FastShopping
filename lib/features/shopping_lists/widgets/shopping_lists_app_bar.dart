import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

import 'shopping_lists_tab_bar.dart';

class ShoppingListsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ShoppingListsAppBar({Key? key, required this.tabController})
      : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(key: ValueKey('lists-back')),
      title: Text(S.of(context)!.shopping_lists_title),
      bottom: ShoppingListsTabBar(controller: tabController),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + ShoppingListsTabBar.height);
}
