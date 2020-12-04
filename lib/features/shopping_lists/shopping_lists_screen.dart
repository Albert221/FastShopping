import 'package:clock/clock.dart';
import 'package:fast_shopping_bloc/shopping_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/new_list/new_list_floating_action_button.dart';
import 'widgets/shopping_lists_app_bar.dart';
import 'widgets/tabs/archived_tab.dart';
import 'widgets/tabs/current_tab.dart';

class ShoppingListsScreen extends HookWidget {
  const ShoppingListsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    final fabShown = useListenable(tabController.animation).value < 0.5;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ShoppingListsAppBar(tabController: tabController),
      floatingActionButton: fabShown
          ? NewListFloatingActionButton(
              shoppingListsCubit: context.watch<ShoppingListsCubit>(),
              clock: context.watch<Clock>(),
            )
          : null,
      body: TabBarView(
        controller: tabController,
        children: [
          CurrentTab(shoppingListsCubit: context.watch<ShoppingListsCubit>()),
          ArchivedTab(shoppingListsCubit: context.watch<ShoppingListsCubit>()),
        ],
      ),
    );
  }
}
