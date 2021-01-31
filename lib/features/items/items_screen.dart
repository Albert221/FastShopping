import 'package:animations/animations.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';
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
          content: Text(S.of(context).shopping_list_archived_snackbar_message),
          action: SnackBarAction(
            label: S.of(context).shopping_list_archived_snackbar_undo,
            onPressed: () => context.read<ShoppingListsCubit>()
              ..unarchive(list.id)
              ..select(list.id),
          ),
        ),
      );
  }

  void _blurFocus(BuildContext context) {
    final cubit = context.read<SelectedShoppingListCubit>();
    if (cubit.state.itemActionState is ItemActionEditing) {
      cubit.stopEditingItem();
    }
  }

  @override
  Widget build(BuildContext context) {
    final fabShown = context.select(
      (SelectedShoppingListCubit c) => c.state.list != null,
    );
    final shoppingListsMultiple = context.select(
      (AppSettingsCubit c) =>
          c.state.shoppingListsMode == ShoppingListsMode.multiple,
    );

    final fabLocation = shoppingListsMultiple
        ? FloatingActionButtonLocation.endDocked
        : FloatingActionButtonLocation.endFloat;

    return GestureDetector(
      onTap: () => _blurFocus(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const ItemsAppBar(),
        floatingActionButtonLocation: fabLocation,
        floatingActionButton: fabShown
            ? FloatingActionButton(
                onPressed: () => _onAddItemTap(context),
                child: const Icon(Icons.add),
              )
            : null,
        bottomNavigationBar: shoppingListsMultiple
            ? BlocBuilder<SelectedShoppingListCubit, SelectedShoppingListState>(
                builder: (context, state) =>
                    ShoppingListBar(shoppingList: state.list),
              )
            : null,
        body: BlocBuilder<SelectedShoppingListCubit, SelectedShoppingListState>(
          builder: (context, state) {
            Widget child;
            if (state.list == null) {
              child = const NoListSelectedPlaceholder();
            } else if (state.list.availableItems.isEmpty) {
              child = NoItemsPlaceholder(fabLocation: fabLocation);
            } else {
              child = ImplicitlyAnimatedReorderableList<Item>(
                areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
                items: state.list.availableItems,
                onReorderFinished: (item, from, to, newItems) => context
                    .read<SelectedShoppingListCubit>()
                    .moveItem(from, to),
                header: shoppingListsMultiple
                    ? ArchiveBanner(
                        visible: state.list.allItemsDone,
                        onArchiveTap: () => _onArchiveTap(context, state.list),
                      )
                    : null,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (context, itemAnimation, item, index) =>
                    Reorderable(
                  key: ValueKey(item.id),
                  builder: (context, dragAnimation, inDrag) =>
                      SizeFadeTransition(
                    key: ValueKey('d-${item.id}'), // see: screenshots_test.dart
                    curve: standardEasing,
                    animation: itemAnimation,
                    child: Handle(
                      delay: const Duration(milliseconds: 500),
                      child: _DraggableTileContainer(
                        dragAnimation: dragAnimation,
                        expanded: state.itemActionState.isExpanded(item.id),
                        child: _ItemTile(
                          item: item,
                          itemActionState: state.itemActionState,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }

            return AnimatedSwitcher(
              switchInCurve: standardEasing,
              switchOutCurve: standardEasing,
              duration: const Duration(milliseconds: 300),
              child: child,
            );
          },
        ),
      ),
    );
  }
}

class _DraggableTileContainer extends StatelessWidget {
  const _DraggableTileContainer({
    Key key,
    @required this.expanded,
    @required this.child,
    this.dragAnimation,
  }) : super(key: key);

  final Animation<double> dragAnimation;
  final bool expanded;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: dragAnimation,
      builder: (context, child) {
        final elevation = standardEasing.transform(dragAnimation.value) * 4;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: expanded
                      ? EdgeInsets.zero
                      : const EdgeInsets.symmetric(horizontal: 16),
                  child: Material(
                    elevation: elevation,
                    borderRadius: expanded ? null : BorderRadius.circular(4),
                    color: Colors.transparent,
                  ),
                ),
              ),
              child,
            ],
          ),
        );
      },
      child: child,
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
    final selectedShoppingListCubit = context.read<SelectedShoppingListCubit>();
    selectedShoppingListCubit.removeItem(item.id);

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(S.of(context).item_removed_snackbar_message),
        action: SnackBarAction(
          label: S.of(context).item_removed_snackbar_undo,
          onPressed: () => selectedShoppingListCubit.undoRemoveItem(item.id),
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return ItemTile(
      item: item,
      onDoneChanged: (done) {
        final moveDoneToEnd =
            context.read<AppSettingsCubit>().state.moveDoneToEnd;

        context
            .read<SelectedShoppingListCubit>()
            .setItemDone(item.id, done, moveDoneToEnd: moveDoneToEnd);
      },
      onTitleChanged: (value) => context
          .read<SelectedShoppingListCubit>()
          .setItemTitle(item.id, value),
      onRemoved: () => _onRemoveTap(context, item),
      expanded: itemActionState.isExpanded(item.id),
      onExpandedChanged: (value) {
        value
            ? context.read<SelectedShoppingListCubit>().expandItem(item.id)
            : context.read<SelectedShoppingListCubit>().collapseItem();
      },
      editing: itemActionState.isEditing(item.id),
      onEditingChanged: (value) => value
          ? context.read<SelectedShoppingListCubit>().startEditingItem()
          : context.read<SelectedShoppingListCubit>().stopEditingItem(),
    );
  }
}
