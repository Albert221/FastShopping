import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';

import 'item_tile.dart';

class CollapsedItemTile extends StatelessWidget {
  const CollapsedItemTile({Key key}) : super(key: key);

  static const _emptyTitleStyle = TextStyle(
    color: Colors.black54,
    fontStyle: FontStyle.italic,
  );

  @override
  Widget build(BuildContext context) {
    final item = ItemTile.of(context).item;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: InkWell(
          onTap: () => ItemTile.of(context).onExpandedChanged?.call(true),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: item.doneAt != null,
                  onChanged: ItemTile.of(context).onDoneChanged,
                ),
                Text(
                  item.title.isNotEmpty
                      ? item.title
                      : S.of(context).list_item_no_name,
                  style: item.title.isEmpty ? _emptyTitleStyle : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
