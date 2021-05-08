import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

import 'animated_line_through_text.dart';

class CollapsedItemTile extends StatelessWidget {
  const CollapsedItemTile({
    Key? key,
    required this.item,
    this.onDoneChanged,
    required this.onExpandedChanged,
  }) : super(key: key);

  final Item item;
  final ValueChanged<bool>? onDoneChanged;
  final ValueChanged<bool>? onExpandedChanged;

  @override
  Widget build(BuildContext context) {
    final emptyTitleStyle = TextStyle(
      color: DefaultTextStyle.of(context).style.color!.withOpacity(.54),
      fontStyle: FontStyle.italic,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: InkWell(
          onTap: () => onExpandedChanged?.call(true),
          onLongPress: () {}, // don't handle tap on reordering
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    DefaultTextStyle.of(context).style.color!.withOpacity(.12),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Checkbox(
                    value: item.done,
                    onChanged: onDoneChanged != null
                        ? (value) => onDoneChanged!(value!)
                        : null,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                    child: AnimatedLineThroughText(
                      item.title.isNotEmpty
                          ? item.title
                          : S.of(context)!.list_item_no_name,
                      stroked: item.done,
                      duration: const Duration(milliseconds: 300),
                      curve: standardEasing,
                      style: item.title.isEmpty ? emptyTitleStyle : null,
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
