import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class ShoppingListsTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ShoppingListsTabBar({Key key, @required this.controller})
      : super(key: key);

  // _kTextAndIconTabHeight + indicatorHeight
  static const height = 72.0 + 3;

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: [
        Tab(
          icon: const Icon(Icons.local_grocery_store),
          text: S.of(context).shopping_lists_tab_current,
        ),
        Tab(
          icon: const Icon(Icons.archive),
          text: S.of(context).shopping_lists_tab_archived,
        ),
      ],
      labelStyle: const TextStyle(fontWeight: FontWeight.w700),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const MD2Indicator(
        indicatorColor: Colors.black,
        indicatorHeight: 3,
        indicatorSize: MD2IndicatorSize.normal,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
