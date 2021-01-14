import 'package:animations/animations.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:fast_shopping_bloc/selected_shopping_list.dart';
import 'package:fast_shopping_bloc/shopping_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';

import 'add_item_dialog.dart';
import 'widgets/app_bar.dart';
import 'widgets/archive_banner.dart';
import 'widgets/item_tile/item_tile.dart';
import 'widgets/no_items_placeholder.dart';
import 'widgets/no_list_selected_placeholder.dart';
import 'widgets/shopping_list_bar.dart';

class ItemsScreen extends StatelessWidget {
  Future<void> _onAddItemTap(BuildContext context) async {
    final title = await showModal<String>(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(),
      builder: (context) => const AddItemDialog(),
    );

    if (title == null) return;

    context.read<SelectedShoppingListCubit>().addItem(title);
  }

  void _onArchiveTap(BuildContext context, ShoppingList list) {
    context.read<ShoppingListsCubit>().archive(list.id);

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(S.of(context).list_archived_snackbar_message),
          action: SnackBarAction(
            label: S.of(context).list_archived_snackbar_undo,
            onPressed: () => context.read<ShoppingListsCubit>()
              ..unarchive(list.id)
              ..select(list.id),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final fabShown =
        context.watch<SelectedShoppingListCubit>().state.list != null;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const ItemsAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: fabShown
          ? FloatingActionButton(
              onPressed: () => _onAddItemTap(context),
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar:
          BlocBuilder<SelectedShoppingListCubit, SelectedShoppingListState>(
        builder: (context, state) => ShoppingListBar(shoppingList: state.list),
      ),
      body: BlocBuilder<SelectedShoppingListCubit, SelectedShoppingListState>(
        builder: (context, state) {
          if (state.list == null) {
            return const NoListSelectedPlaceholder();
          } else if (state.list.availableItems.isEmpty) {
            return const NoItemsPlaceholder();
          }

          return ImplicitlyAnimatedReorderableList<Item>(
            areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            items: state.list.availableItems,
            onReorderFinished: (item, from, to, newItems) {
              // todo
            },
            shrinkWrap: true,
            header: ArchiveBanner(
              visible: state.list.allItemsDone,
              onArchiveTap: () => _onArchiveTap(context, state.list),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (context, itemAnimation, item, index) {
              return Reorderable(
                key: ValueKey(item.id),
                builder: (context, dragAnimation, child) => SizeFadeTransition(
                  curve: standardEasing,
                  animation: itemAnimation,
                  child: _ItemTile(
                    item: item,
                    itemActionState: state.itemActionState,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({
    Key key,
    @required this.item,
    @required this.itemActionState,
  }) : super(key: key);

  final Item item;
  final ItemActionState itemActionState;

  void _onRemoveTap(BuildContext context, Item item) {
    context.read<SelectedShoppingListCubit>().removeItem(item.id);

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(S.of(context).item_removed_snackbar_message),
        action: SnackBarAction(
          label: S.of(context).item_removed_snackbar_undo,
          onPressed: () =>
              context.read<SelectedShoppingListCubit>().undoRemoveItem(item.id),
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ItemTile(
        key: ValueKey(item.id),
        item: item,
        onDoneChanged: (done) => context
            .read<SelectedShoppingListCubit>()
            .setItemDone(item.id, done),
        onTitleChanged: (value) => context
            .read<SelectedShoppingListCubit>()
            .setItemTitle(item.id, value),
        onRemoved: () => _onRemoveTap(context, item),
        expanded: itemActionState.maybeWhen(
          expanded: (itemId) => itemId == item.id,
          editing: (itemId) => itemId == item.id,
          orElse: () => false,
        ),
        onExpandedChanged: (value) {
          value
              ? context.read<SelectedShoppingListCubit>().expandItem(item.id)
              : context.read<SelectedShoppingListCubit>().collapseItem();
        },
        editing: itemActionState.maybeWhen(
          editing: (itemId) => itemId == item.id,
          orElse: () => false,
        ),
        onEditingChanged: (value) => value
            ? context.read<SelectedShoppingListCubit>().startEditingItem()
            : context.read<SelectedShoppingListCubit>().stopEditingItem(),
      ),
    );
  }
}
