import 'package:animations/animations.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:fast_shopping_bloc/selected_shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'widgets/add_item_dialog.dart';
import 'widgets/app_bar.dart';
import 'widgets/item_tile/item_tile.dart';
import 'widgets/items_list.dart';
import 'widgets/shopping_list_bar.dart';

class ItemsScreen extends StatelessWidget {
  Future<void> _onAddItemTap(BuildContext context) async {
    final title = await showModal<String>(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(),
      builder: (context) => const AddItemDialog(),
    );

    if (title == null) return;

    context.read<SelectedShoppingListCubit>().add(
          Item(
            id: Uuid().v4(),
            title: title,
          ),
        );
  }

  void _onRemoveTap(BuildContext context, Item item) {
    // TODO(Albert221): Show confirmation dialog

    context.read<SelectedShoppingListCubit>().remove(item.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ItemsAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onAddItemTap(context),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const ShoppingListBar(),
      //
      body: BlocBuilder<SelectedShoppingListCubit, SelectedShoppingListState>(
        builder: (context, state) => state.list != null
            ? ItemsList(
                items: state.list.items,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ItemTile(
                    item: item,
                    onDoneChanged: (done) => context
                        .read<SelectedShoppingListCubit>()
                        .setDone(item.id, done),
                    onTitleChanged: (value) => context
                        .read<SelectedShoppingListCubit>()
                        .setTitle(item.id, value),
                    onRemoved: () => _onRemoveTap(context, item),
                    expanded: state.itemActionState.maybeWhen(
                      expanded: (itemId) => itemId == item.id,
                      editing: (itemId) => itemId == item.id,
                      orElse: () => false,
                    ),
                    onExpandedChanged: (value) => value
                        ? context
                            .read<SelectedShoppingListCubit>()
                            .expandItem(item.id)
                        : context
                            .read<SelectedShoppingListCubit>()
                            .collapseItem(),
                    editing: state.itemActionState.maybeWhen(
                      editing: (itemId) => itemId == item.id,
                      orElse: () => false,
                    ),
                    onEditingChanged: (value) => value
                        ? context
                            .read<SelectedShoppingListCubit>()
                            .startEditing()
                        : context
                            .read<SelectedShoppingListCubit>()
                            .stopEditing(),
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
