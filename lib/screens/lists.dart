import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/screens/screens.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:fast_shopping/utils/extensions.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart' hide SimpleDialog;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class ListsScreen extends StatefulWidget {
  @override
  _ListsScreenState createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  bool _fabShown = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..animation.addListener(() {
        if (_tabController.animation.value < 0.5 && !_fabShown) {
          setState(() => _fabShown = true);
        } else if (_tabController.animation.value >= 0.5 && _fabShown) {
          setState(() => _fabShown = false);
        }
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool _shouldShowFab(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shopping_lists_title'.i18n),
        bottom: TabBar(
          controller: _tabController,
          labelStyle: const TextStyle(fontWeight: FontWeight.w700),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const MD2Indicator(
            indicatorColor: Colors.black,
            indicatorHeight: 3,
            indicatorSize: MD2IndicatorSize.normal,
          ),
          tabs: [
            Tab(
              icon: const Icon(Icons.local_grocery_store),
              text: 'shopping_lists_tab_current'.i18n,
            ),
            Tab(
              icon: const Icon(Icons.archive),
              text: 'shopping_lists_tab_archived'.i18n,
            ),
          ],
        ),
      ),
      floatingActionButton: _fabShown && _shouldShowFab(context)
          ? FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: Text('shopping_lists_add_new'.i18n),
              onPressed: () async {
                final name = await showDialog(
                  context: context,
                  builder: (context) => AddListDialog(),
                );

                if (name != null) {
                  context.store.dispatch(AddShoppingList(name as String));
                }
              },
            )
          : null,
      body: TabBarView(
        controller: _tabController,
        children: [
          _ShoppingListTab(
            selector: (lists) => lists.where((list) => !list.archived).toList(),
            onTap: (list) {
              context.store.dispatch(SetCurrentShoppingList(list));
              // Go back to main screen.
              Navigator.pop(context);
            },
            trailingBuilder: (list) => IconButton(
              icon: const Icon(Icons.archive),
              onPressed: () {
                context.store.dispatch(ArchiveShoppingList(list));
              },
            ),
          ),
          _ShoppingListTab(
            selector: (lists) => lists.where((list) => list.archived).toList(),
            trailingBuilder: (list) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.unarchive),
                  onPressed: () {
                    context.store.dispatch(UnarchiveShoppingList(list));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_forever),
                  onPressed: () {
                    final dialogBodyParts =
                        'delete_shopping_list_dialog_body'.i18n.split(r'$1');

                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: 'delete_shopping_list_dialog_title'.i18n,
                        body: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              TextSpan(text: dialogBodyParts.first),
                              TextSpan(
                                text: list.name,
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                              TextSpan(text: dialogBodyParts.last),
                            ],
                          ),
                        ),
                        primaryButton: DangerFlatButton(
                          text: 'delete_shopping_list_dialog_delete'.i18n,
                          onPressed: () {
                            context.store.dispatch(RemoveShoppingList(list));
                            Navigator.pop(context);
                          },
                        ),
                        secondaryButton: SecondaryFlatButton(
                          text: 'delete_shopping_list_dialog_cancel'.i18n,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    );
                    // todo: Show confirm dialog and delete the list.
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShoppingListTab extends StatelessWidget {
  final List<ShoppingList> Function(List<ShoppingList>) selector;
  final void Function(ShoppingList) onTap;
  final Widget Function(ShoppingList) trailingBuilder;

  const _ShoppingListTab({
    Key key,
    @required this.selector,
    this.onTap,
    this.trailingBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<FastShoppingState, List<ShoppingList>>(
      converter: (store) => selector(store.state.lists.toList()),
      builder: (context, lists) => ListView.builder(
        padding: const EdgeInsets.only(bottom: 72),
        itemCount: lists.length,
        itemBuilder: (context, i) {
          final list = lists[i];
          final itemsCount = context.store.state.items
              .where((item) => item.shoppingListId == list.id && !item.removed)
              .length;

          return ListTile(
            leading: const Icon(Icons.list),
            title: Text(list.name),
            subtitle:
                Text('shopping_lists_item_elements'.i18nNumber(itemsCount)),
            onTap: onTap == null ? null : () => onTap(list),
            trailing: trailingBuilder?.call(list),
          );
        },
      ),
    );
  }
}
