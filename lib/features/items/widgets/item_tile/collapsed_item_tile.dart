import 'package:fast_shopping/features/items/widgets/item_tile/animated_line_through_text.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter/material.dart';

class CollapsedItemTile extends StatelessWidget {
  const CollapsedItemTile({
    Key key,
    @required this.item,
    this.onDoneChanged,
    @required this.onExpandedChanged,
  }) : super(key: key);

  final Item item;
  final ValueChanged<bool> onDoneChanged;
  final ValueChanged<bool> onExpandedChanged;

  static const _emptyTitleStyle = TextStyle(
    color: Colors.black54,
    fontStyle: FontStyle.italic,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: InkWell(
          onTap: () => onExpandedChanged?.call(true),
          onLongPress: () {}, // don't handle tap on reordering
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Checkbox(
                    value: item.doneAt != null,
                    onChanged: onDoneChanged,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                    child: AnimatedLineThroughText(
                      item.title.isNotEmpty
                          ? item.title
                          : S.of(context).list_item_no_name,
                      stroked: item.doneAt != null,
                      duration: const Duration(milliseconds: 300),
                      curve: standardEasing,
                      style: item.title.isEmpty ? _emptyTitleStyle : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
