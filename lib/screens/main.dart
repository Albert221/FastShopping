import 'dart:async';

import 'package:animations/animations.dart';
import 'package:fast_shopping/l10n/l10n.dart';
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
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 16),
          Text(S.of(context).app_title),
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
                  Text(S.of(context).menu_donate),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'licenses',
              child: Row(
                children: [
                  const Icon(Icons.info_outline),
                  const SizedBox(width: 16),
                  Text(S.of(context).menu_licenses),
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
                applicationName: S.of(context).app_title,
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

  bool isKeyboardHidden(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom == 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<FastShoppingState, bool>(
      converter: (store) => ListsSelectors.anyListChoosen(store),
      builder: (context, anyListChosen) =>
          isKeyboardHidden(context) && anyListChosen
              ? FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () => _showAddItemDialog(context),
                )
              : const SizedBox(),
    );
  }
}

class _BottomAppBar extends StatefulWidget {
  const _BottomAppBar();

  @override
  _BottomAppBarState createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<_BottomAppBar> {
  static const _requiredDragOffset = 100;
  double _verticalDragOffset = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<FastShoppingState, ShoppingList>(
      converter: (store) => ListsSelectors.currentList(store),
      builder: (context, list) => BottomAppBar(
        notchMargin: 8,
        child: OpenContainer(
          closedColor: Theme.of(context).bottomAppBarColor,
          closedBuilder: (context, openListsScreen) {
            return GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {
                _verticalDragOffset += details.primaryDelta;
              },
              onVerticalDragEnd: (DragEndDetails details) {
                if (-_verticalDragOffset >= _requiredDragOffset) {
                  openListsScreen();
                }

                _verticalDragOffset = 0;
              },
              child: InkWell(
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
                              S
                                  .of(context)
                                  .shopping_list_not_selected_placeholder,
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic),
                              overflow: TextOverflow.ellipsis,
                            )
                          : Text(
                              list.name.isNotEmpty
                                  ? list.name
                                  : S.of(context).shopping_list_no_name,
                              style: list.name.isEmpty
                                  ? const TextStyle(fontStyle: FontStyle.italic)
                                  : null,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                    const SizedBox(width: 88),
                  ],
                ),
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
    final items = ItemsSelectors.currentListItems(store);
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
            content: Text(S.of(context).item_removed_snackbar_message),
            action: SnackBarAction(
              textColor: PrimaryFlatButton.buttonColor,
              label: S.of(context).item_removed_snackbar_undo,
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
      converter: (store) => ListsSelectors.anyListChoosen(store),
      builder: (context, shoppingListAvailable) {
        if (!shoppingListAvailable) {
          return const _NoListSelectedPlaceholder();
        }

        return StoreConnector<FastShoppingState, List<Item>>(
          onInit: _onStoreInit,
          converter: (store) => ItemsSelectors.currentListItems(store),
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
              S.of(context).shopping_list_not_selected_message,
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
              S.of(context).empty_list_add_some_items_message,
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
        content: Text(S.of(context).list_archived_snackbar_message),
        action: SnackBarAction(
          textColor: PrimaryFlatButton.buttonColor,
          label: S.of(context).list_archived_snackbar_undo,
          onPressed: () {
            store.dispatch(UnarchiveShoppingList(list));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shouldShowBanner =
        ItemsSelectors.isCurrentListEveryItemDoneOrDeleted(context.store);

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
              _archiveList(context, ListsSelectors.currentList(context.store)),
        ),
        secondChild: const SizedBox(width: double.infinity),
      ),
    );
  }
}
