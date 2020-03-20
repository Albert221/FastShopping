import 'dart:async';

import 'package:animations/animations.dart';
import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/screens/screens.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:fast_shopping/utils/extensions.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const _FloatingActionButton(),
      bottomNavigationBar: const _BottomAppBar(),
      body: _Body(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 16),
          Text('app_title'.i18n),
        ],
      ),
      actions: [
        PopupMenuButton<String>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'donate',
              child: Row(
                children: [
                  const Icon(Icons.attach_money),
                  const SizedBox(width: 16),
                  Text('menu_donate'.i18n),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'licenses',
              child: Row(
                children: [
                  const Icon(Icons.info_outline),
                  const SizedBox(width: 16),
                  Text('menu_licenses'.i18n),
                ],
              ),
            ),
          ],
          onSelected: (index) {
            if (index == 'donate') {
              showModal(
                context: context,
                configuration: FadeScaleTransitionConfiguration(),
                builder: (context) => DonateDialog(),
              );
            } else if (index == 'licenses') {
              showLicensePage(
                context: context,
                applicationName: 'app_title'.i18n,
              );
            }
          },
        ),
      ],
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  void _showAddItemDialog(BuildContext context) async {
    final result = await showModal(
      context: context,
      configuration: FadeScaleTransitionConfiguration(),
      builder: (context) => AddItemDialog(),
    );

    if (result != null) {
      context.store.dispatch(AddItem(
        result as String,
        context.store.state.currentListId,
      ));
    }
  }

  bool _shouldShowFab(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom == 0 &&
      context.store.state.currentList != null;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<FastShoppingState, bool>(
      converter: (store) => store.state.currentList != null,
      builder: (context, _) => _shouldShowFab(context)
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _showAddItemDialog(context),
            )
          : const SizedBox(),
    );
  }
}

class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<FastShoppingState, ShoppingList>(
      converter: (store) => store.state.currentList,
      builder: (context, list) => BottomAppBar(
        notchMargin: 8,
        child: OpenContainer(
          closedColor: Theme.of(context).bottomAppBarColor,
          closedBuilder: (context, openListsScreen) {
            return InkWell(
              onTap: openListsScreen,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(Icons.list),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: list == null
                        ? Text(
                            'shopping_list_not_selected_placeholder'.i18n,
                            style: const TextStyle(fontStyle: FontStyle.italic),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            list.name.isNotEmpty
                                ? list.name
                                : 'shopping_list_no_name'.i18n,
                            style: list.name.isEmpty
                                ? const TextStyle(fontStyle: FontStyle.italic)
                                : null,
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                  const SizedBox(width: 88),
                ],
              ),
            );
          },
          openBuilder: (context, _) => ListsScreen(),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  /// Key is an id of the item.
  final _itemsKeys = <String, GlobalKey<ListItemTileState>>{};

  StreamSubscription _itemsSubscription;

  void _onStoreInit(Store<FastShoppingState> store) {
    try {
      _syncItemKeys(store);
    } catch (_) {}

    _itemsSubscription = store.onChange.listen((state) {
      _syncItemKeys(store);
    });
  }

  void _syncItemKeys(Store<FastShoppingState> store) {
    final items = store.state.currentListItems;
    final visitedIds = items.map((item) => item.id);

    items.forEach((item) {
      if (!_itemsKeys.keys.contains(item.id)) {
        _itemsKeys[item.id] = GlobalKey();
      }
    });

    _itemsKeys.removeWhere((id, _) => !visitedIds.contains(id));
  }

  @override
  void dispose() {
    _itemsSubscription?.cancel();

    super.dispose();
  }

  void _deleteItem(BuildContext context, Item item) {
    final store = context.store;

    store.dispatch(RemoveItem(item));
    _itemsKeys[item.id].currentState.collapse();

    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context)
        .showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('item_removed_snackbar_message'.i18n),
            action: SnackBarAction(
              textColor: PrimaryFlatButton.buttonColor,
              label: 'item_removed_snackbar_undo'.i18n,
              onPressed: () {
                store.dispatch(UndoRemovingItem(item));
              },
            ),
          ),
        )
        .closed
        .then((reason) {
      if (reason != SnackBarClosedReason.action) {
        store.dispatch(DeleteItem(item));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<FastShoppingState, bool>(
      converter: (store) => store.state.currentList != null,
      builder: (context, shoppingListAvailable) {
        if (!shoppingListAvailable) {
          return const _NoListSelectedPlaceholder();
        }

        return StoreConnector<FastShoppingState, List<Item>>(
          onInit: _onStoreInit,
          converter: (store) => store.state.currentListItems,
          builder: (context, items) {
            if (items.every((item) => item.removed)) {
              // Works for empty list too
              return _NoItemsPlaceholder();
            }

            return ListView.builder(
              itemCount: items.length + 1,
              itemBuilder: (context, i) {
                if (i == 0) {
                  return _ArchiveBannerSpace();
                }

                final item = items[i - 1];

                return _buildItemRow(context, item);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildItemRow(BuildContext context, Item item) {
    final store = context.store;

    return AnimatedCrossFade(
      key: ValueKey(item.id),
      firstCurve: Curves.ease,
      secondCurve: Curves.ease,
      sizeCurve: Curves.ease,
      duration: const Duration(milliseconds: 300),
      crossFadeState:
          item.removed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ListItemTile(
          key: _itemsKeys[item.id],
          title: item.title,
          done: item.done,
          doneAt: item.doneAt,
          onDoneTap: (value) => value
              ? store.dispatch(MarkItemDone(item))
              : store.dispatch(MarkItemUndone(item)),
          onTitleEdited: (newTitle) {
            store.dispatch(RenameItem(item, newTitle));
          },
          onDeleteTap: () => _deleteItem(context, item),
          onExpand: () {
            _itemsKeys.forEach((id, key) {
              if (id != item.id) {
                key.currentState?.collapse();
              }
            });
          },
          // todo: Reordering using this drag handler
          // dragHandler: ListItemDragHandler(
          //   onDragStart: (details) => debugPrint(details.toString()),
          //   onDragUpdate: (details) => debugPrint(details.toString()),
          //   onDragEnd: (details) => debugPrint(details.toString()),
          // ),
        ),
      ),
      secondChild: const SizedBox(width: double.infinity),
    );
  }
}

class _NoListSelectedPlaceholder extends StatelessWidget {
  const _NoListSelectedPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.only(bottom: 32),
            alignment: Alignment.bottomCenter,
            child: Text(
              'shopping_list_not_selected_message'.i18n,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 20),
            child: SvgPicture.asset(
              'assets/arrow_bottom_app_bar.svg',
              alignment: Alignment.bottomLeft,
              height: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}

class _NoItemsPlaceholder extends StatelessWidget {
  _NoItemsPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.only(bottom: 32),
            alignment: Alignment.bottomCenter,
            child: Text(
              'empty_list_add_some_items_message'.i18n,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 94, bottom: 36),
            child: MediaQuery.of(context).viewInsets.bottom == 0
                ? SvgPicture.asset(
                    'assets/arrow_fab.svg',
                    alignment: Alignment.bottomRight,
                    height: double.infinity,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class _ArchiveBannerSpace extends StatelessWidget {
  _ArchiveBannerSpace();

  void _archiveList(BuildContext context, ShoppingList list) {
    final store = context.store;

    store.dispatch(ArchiveShoppingList(list));

    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('list_archived_snackbar_message'.i18n),
        action: SnackBarAction(
          textColor: PrimaryFlatButton.buttonColor,
          label: 'list_archived_snackbar_undo'.i18n,
          onPressed: () {
            store.dispatch(UnarchiveShoppingList(list));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shouldShowBanner = context.store.state.currentListItems
        .where((item) => !item.removed)
        .every((item) => item.done);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: AnimatedCrossFade(
        firstCurve: Curves.ease,
        secondCurve: Curves.ease,
        sizeCurve: Curves.ease,
        duration: const Duration(milliseconds: 300),
        crossFadeState: shouldShowBanner
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: ArchiveBanner(
          onArchiveTap: () =>
              _archiveList(context, context.store.state.currentList),
        ),
        secondChild: const SizedBox(width: double.infinity),
      ),
    );
  }
}
