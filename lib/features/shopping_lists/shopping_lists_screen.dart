import 'package:fast_shopping/features/shopping_lists/widgets/shopping_list_tile/shopping_list_tile.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/l10n/timeago.dart';
import 'package:fast_shopping/models/shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/shopping_lists_app_bar.dart';

class ShoppingListsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);

    return Scaffold(
      appBar: ShoppingListsAppBar(tabController: tabController),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ShoppingListTile(
                  shoppingList: ShoppingList(
                    id: 'sdfs',
                    name: 'This is a shopping list',
                    createdAt: DateTime.now().subtract(const Duration(days: 4)),
                    items: [],
                  ),
                  current: true,
                  onTap: () {},
                  onRenameTap: () {},
                  onArchiveTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ShoppingListTile(
                  shoppingList: ShoppingList(
                    id: 'sdfs',
                    name: 'This is a shopping list',
                    createdAt: DateTime.now().subtract(const Duration(days: 4)),
                    items: [],
                  ),
                  onTap: () {},
                  onRenameTap: () {},
                  onArchiveTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ShoppingListTile(
                  shoppingList: ShoppingList(
                    id: 'sdfs',
                    name: '',
                    createdAt: DateTime.now().subtract(const Duration(days: 4)),
                    items: [],
                  ),
                  onTap: () {},
                  onRenameTap: () {},
                  onArchiveTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
