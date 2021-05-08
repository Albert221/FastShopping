import 'package:animations/animations.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'new_list_dialog.dart';
import 'widgets/shopping_lists_app_bar.dart';
import 'widgets/tabs/archived_tab.dart';
import 'widgets/tabs/current_tab.dart';

class ShoppingListsScreen extends HookWidget {
  const ShoppingListsScreen({Key? key}) : super(key: key);

  Future<void> _onNewListTapped(BuildContext context) async {
    final name = await showModal<String>(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(),
      builder: (context) => const NewListDialog(),
    );

    if (name == null) return;

    final listId = context.read<ShoppingListsCubit>().addList(name);
    context.read<ShoppingListsCubit>().select(listId);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    final fabShown = useListenable(tabController.animation!).value < 0.5;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ShoppingListsAppBar(tabController: tabController),
      floatingActionButton: fabShown
          ? FloatingActionButton.extended(
              onPressed: () => _onNewListTapped(context),
              icon: const Icon(Icons.add),
              label: Text(S.of(context)!.shopping_lists_add_new),
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
