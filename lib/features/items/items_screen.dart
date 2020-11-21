import 'package:fast_shopping/features/items/widgets/app_bar.dart';
import 'package:fast_shopping/features/items/widgets/shopping_list_bar.dart';
import 'package:fast_shopping/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/item_tile/item_tile.dart';

class ItemsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final expanded = useState(false);
    final title = useState('');
    final doneAt = useState<DateTime>(null);

    return Scaffold(
      appBar: const ItemsAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const ShoppingListBar(),
      //
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          ItemTile(
            item: Item(
              id: 'id',
              title: title.value,
              shoppingListId: 'shid',
              doneAt: doneAt.value,
            ),
            onDoneChanged: (done) =>
                doneAt.value = done ? DateTime.now() : null,
            onTitleChanged: (value) => title.value = value,
            onRemoved: () {},
            expanded: expanded.value,
            onExpandedChanged: (value) => expanded.value = value,
          ),
        ],
      ),
    );
  }
}
