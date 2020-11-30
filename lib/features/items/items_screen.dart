import 'package:fast_shopping/features/items/widgets/app_bar.dart';
import 'package:fast_shopping/features/items/widgets/shopping_list_bar.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/item_tile/item_tile.dart';
import 'widgets/items_list.dart';

class ItemsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final expanded = useState(false);
    final editing = useState(false);
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
      body: ItemsList(
        items: [
          Item(
            id: '65c083de-2534-49cc-9f61-cbb41aa4894b',
            title: title.value,
            doneAt: doneAt.value,
          ),
        ],
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (item) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ItemTile(
            item: item,
            onDoneChanged: (done) =>
                doneAt.value = done ? DateTime.now() : null,
            onTitleChanged: (value) => title.value = value,
            onRemoved: () {},
            expanded: expanded.value,
            onExpandedChanged: (value) {
              if (!value) editing.value = false;
              expanded.value = value;
            },
            editing: editing.value,
            onEditingChanged: (value) => editing.value = value,
          ),
        ),
      ),
    );
  }
}
