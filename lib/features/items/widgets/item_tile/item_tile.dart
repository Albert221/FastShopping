import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'collapsed_item_tile.dart';
import 'expanded_item_tile.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key key,
    @required this.item,
    this.onDoneChanged,
    this.onTitleChanged,
    this.onRemoved,
    this.expanded = false,
    @required this.onExpandedChanged,
    this.editing = false,
    @required this.onEditingChanged,
  }) : super(key: key);

  final Item item;
  final ValueChanged<bool> onDoneChanged;
  final ValueChanged<String> onTitleChanged;
  final VoidCallback onRemoved;
  final bool expanded;
  final ValueChanged<bool> onExpandedChanged;
  final bool editing;
  final ValueChanged<bool> onEditingChanged;

  Future<bool> _onPop(BuildContext context) {
    if (editing) {
      onEditingChanged?.call(false);
      return SynchronousFuture(false);
    } else if (expanded) {
      onExpandedChanged?.call(false);
      return SynchronousFuture(false);
    }

    return SynchronousFuture(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onPop(context),
      child: AnimatedCrossFade(
        crossFadeState:
            expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstCurve: standardEasing,
        secondCurve: standardEasing,
        sizeCurve: standardEasing,
        duration: const Duration(milliseconds: 300),
        firstChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CollapsedItemTile(
            item: item,
            onDoneChanged: onDoneChanged,
            onExpandedChanged: onExpandedChanged,
          ),
        ),
        secondChild: ExpandedItemTile(
          item: item,
          onDoneChanged: onDoneChanged,
          onTitleChanged: onTitleChanged,
          onRemoved: onRemoved,
          expanded: expanded,
          onExpandedChanged: onExpandedChanged,
          editing: editing,
          onEditingChanged: onEditingChanged,
        ),
      ),
    );
  }
}
