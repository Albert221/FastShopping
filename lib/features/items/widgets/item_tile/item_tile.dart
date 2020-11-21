import 'package:fast_shopping/features/items/widgets/item_tile/expanded_item_tile.dart';
import 'package:fast_shopping/models/item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'collapsed_item_tile.dart';

class ItemTileData extends ChangeNotifier {
  ItemTileData({
    @required Item item,
    ValueChanged<bool> onDoneChanged,
    ValueChanged<String> onTitleChanged,
    VoidCallback onRemoved,
    bool expanded,
    @required ValueChanged<bool> onExpandedChanged,
    bool editing,
    @required ValueChanged<bool> onEditingChanged,
  })  : _item = item,
        _onDoneChanged = onDoneChanged,
        _onTitleChanged = onTitleChanged,
        _onRemoved = onRemoved,
        _expanded = expanded,
        _onExpandedChanged = onExpandedChanged,
        _editing = editing,
        _onEditingChanged = onEditingChanged,
        assert(
          !editing || editing && expanded,
          'expanded must be true if editing is true',
        );

  // Item & events
  Item _item;
  Item get item => _item;
  set item(Item value) {
    _item = value;
    notifyListeners();
  }

  ValueChanged<bool> _onDoneChanged;
  ValueChanged<bool> get onDoneChanged => _onDoneChanged;
  set onDoneChanged(ValueChanged<bool> value) {
    _onDoneChanged = value;
    notifyListeners();
  }

  ValueChanged<String> _onTitleChanged;
  ValueChanged<String> get onTitleChanged => _onTitleChanged;
  set onTitleChanged(ValueChanged<String> value) {
    _onTitleChanged = value;
    notifyListeners();
  }

  VoidCallback _onRemoved;
  VoidCallback get onRemoved => _onRemoved;
  set onRemoved(VoidCallback value) {
    _onRemoved = value;
    notifyListeners();
  }

  // Expanding
  final bool _expanded;
  bool get expanded => _expanded;

  ValueChanged<bool> _onExpandedChanged;
  ValueChanged<bool> get onExpandedChanged => _onExpandedChanged;
  set onExpandedChanged(ValueChanged<bool> value) {
    _onExpandedChanged = value;
    notifyListeners();
  }

  // Local state
  final bool _editing;
  bool get editing => _editing;

  ValueChanged<bool> _onEditingChanged;
  ValueChanged<bool> get onEditingChanged => _onEditingChanged;
  set onEditingChanged(ValueChanged<bool> value) {
    _onEditingChanged = value;
    notifyListeners();
  }
}

class ItemTile extends InheritedNotifier<ItemTileData> {
  ItemTile({
    Key key,
    @required Item item,
    ValueChanged<bool> onDoneChanged,
    ValueChanged<String> onTitleChanged,
    VoidCallback onRemoved,
    bool expanded = false,
    @required ValueChanged<bool> onExpandedChanged,
    bool editing = false,
    @required ValueChanged<bool> onEditingChanged,
  }) : super(
          key: key,
          notifier: ItemTileData(
            item: item,
            onDoneChanged: onDoneChanged,
            onTitleChanged: onTitleChanged,
            onRemoved: onRemoved,
            expanded: expanded,
            onExpandedChanged: onExpandedChanged,
            editing: editing,
            onEditingChanged: onEditingChanged,
          ),
          child: const _ItemTile(),
        );

  static ItemTileData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ItemTile>().notifier;
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({Key key}) : super(key: key);

  Future<bool> _onPop(BuildContext context) {
    final itemTile = ItemTile.of(context);

    if (itemTile.editing) {
      itemTile.onEditingChanged?.call(false);
      return SynchronousFuture(false);
    } else if (itemTile.expanded) {
      itemTile.onExpandedChanged?.call(false);
      return SynchronousFuture(false);
    }

    return SynchronousFuture(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onPop(context),
      child: AnimatedCrossFade(
        crossFadeState: ItemTile.of(context).expanded
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        firstCurve: Curves.ease,
        secondCurve: Curves.ease,
        sizeCurve: Curves.ease,
        duration: const Duration(milliseconds: 300),
        firstChild: const CollapsedItemTile(),
        secondChild: const ExpandedItemTile(),
      ),
    );
  }
}
