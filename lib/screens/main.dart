import 'dart:async';

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
  /// Key is an id of the item.
  final _itemsKeys = <String, GlobalKey<ListItemTileState>>{};
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
      print('imma delete: ' + reason.toString());
      if (reason != SnackBarClosedReason.action) {
        print('deleted');
        store.dispatch(DeleteItem(item));
      }
    });
  }

  void _archiveList(BuildContext context, ShoppingList list) {
    final store = context.store;

    store.dispatch(ArchiveShoppingList(list));

    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(
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

  bool _shouldShowFab(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom == 0 &&
      context.store.state.currentList != null;

  @override
  Widget build(BuildContext context) {
    final store = context.store;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: Image.asset('assets/logo.png', color: Colors.black),
            ),
            const SizedBox(width: 16),
            Text('app_title'.i18n),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: StoreConnector<FastShoppingState, bool>(
        converter: (store) => store.state.currentList != null,
        builder: (context, _) => _shouldShowFab(context)
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                  final result = await showDialog(
                    context: context,
                    builder: (context) => AddItemDialog(),
                  );

                  if (result != null) {
                    store.dispatch(AddItem(
                      result as String,
                      store.state.currentListId,
                    ));
                  }
                },
              )
            : const SizedBox(),
      ),
      bottomNavigationBar: StoreConnector<FastShoppingState, ShoppingList>(
        converter: (store) => store.state.currentList,
        builder: (context, list) => BottomAppBar(
          notchMargin: 8,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListsScreen()),
                    );
                  },
                ),
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
                        list.name,
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
              const SizedBox(width: 88),
            ],
          ),
        ),
      ),
      body: StoreConnector<FastShoppingState, bool>(
        converter: (store) => store.state.currentList != null,
        builder: (context, shoppingListAvailable) {
          if (!shoppingListAvailable) {
            // return Center(child: Text('shopping_list_not_selected'.i18n));

            return _buildNoListSelectedPlaceholder();
          }

          return StoreConnector<FastShoppingState, List<Item>>(
            onInit: _onStoreInit,
            converter: (store) => store.state.currentListItems,
            builder: (context, items) {
              if (items.every((item) => item.removed)) {
                // Works for empty list too
                return _buildNoItemsPlaceholder(context);
              }

              return ListView.builder(
                itemCount: items.length + 1,
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return _buildArchiveBannerSpace(context);
                  }

                  final item = items[i - 1];

                  return _buildItemRow(context, item);
                },
              );
            },
          );
        },
      ),
    );
  }

  bool _shouldShowArchiveBanner(BuildContext context) {
    final items = context.store.state.currentListItems;

    return items.where((item) => !item.removed).every((item) => item.done);
  }

  Widget _buildArchiveBannerSpace(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: AnimatedCrossFade(
        firstCurve: Curves.ease,
        secondCurve: Curves.ease,
        sizeCurve: Curves.ease,
        duration: const Duration(milliseconds: 300),
        crossFadeState: _shouldShowArchiveBanner(context)
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
          dragHandler: ListItemDragHandler(
            onDragStart: (details) {
              debugPrint(details.toString());
            },
            onDragUpdate: (details) {
              debugPrint(details.toString());
            },
            onDragEnd: (details) {
              debugPrint(details.toString());
            },
          ),
        ),
      ),
      secondChild: const SizedBox(width: double.infinity),
    );
  }

  Widget _buildNoListSelectedPlaceholder() {
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

  Widget _buildNoItemsPlaceholder(BuildContext context) {
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
            child: _shouldShowFab(context)
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
