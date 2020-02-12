import 'package:fast_shopping/models/models.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:fast_shopping/utils/extensions.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping lists'),
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
              text: 'Current',
            ),
            Tab(
              icon: const Icon(Icons.archive),
              text: 'Archived',
            ),
          ],
        ),
      ),
      floatingActionButton: _fabShown
          ? FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: Text('NEW LIST'),
              onPressed: () {
                context.store.dispatch(AddShoppingList('New list'));
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
        itemCount: lists.length,
        itemBuilder: (context, i) {
          final list = lists[i];
          final itemsCount = context.store.state.items
              .where((item) => item.shoppingListId == list.id && !item.removed)
              .length;

          return ListTile(
            leading: const Icon(Icons.list),
            title: Text(list.name),
            subtitle: Text('$itemsCount elements'),
            onTap: onTap == null ? null : () => onTap(list),
            trailing: trailingBuilder?.call(list),
          );
        },
      ),
    );
  }
}
