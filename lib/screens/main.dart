import 'dart:async';

import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:fast_shopping/utils/extensions.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Key is an id of the item.
  final _itemsKeys = <String, GlobalKey<ListItemTileState>>{};

  StreamSubscription itemsSubscription;

  void _onStoreInit(Store<FastShoppingState> store) {
    try {
      _syncItemKeys(store);
    } catch (_) {}

    itemsSubscription = store.onChange.listen((state) {
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
    itemsSubscription?.cancel();

    super.dispose();
  }

  bool _shouldShowFab(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom == 0;

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
    final store = context.store;

    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.i18n),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: _shouldShowFab(context)
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  barrierDismissible: false,
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
          : null,
      bottomNavigationBar: StoreConnector<FastShoppingState, ShoppingList>(
        converter: (store) => store.state.currentList,
        builder: (context, list) => BottomAppBar(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 8),
              Text(list.name),
            ],
          ),
        ),
      ),
      body: StoreConnector<FastShoppingState, List<Item>>(
        onInit: _onStoreInit,
        converter: (store) => store.state.currentListItems,
        builder: (context, items) => ListView.builder(
          itemCount: items.length + 1,
          itemBuilder: (context, i) {
            if (i == 0) {
              return _buildArchiveBannerSpace();
            }

            final item = items[i - 1];

            return _buildItemRow(context, item);
          },
        ),
      ),
    );
  }

  bool _shouldShowArchiveBanner(BuildContext context) =>
      context.store.state.currentListItems
          .every((item) => item.done || item.removed);

  Widget _buildArchiveBannerSpace() {
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
          onArchiveTap: () {},
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
}
