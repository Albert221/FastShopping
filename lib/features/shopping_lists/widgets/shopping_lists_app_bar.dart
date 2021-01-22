import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'shopping_lists_tab_bar.dart';

class ShoppingListsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ShoppingListsAppBar({Key key, @required this.tabController})
      : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.of(context).shopping_lists_title),
      bottom: ShoppingListsTabBar(controller: tabController),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + ShoppingListsTabBar.height);
}
