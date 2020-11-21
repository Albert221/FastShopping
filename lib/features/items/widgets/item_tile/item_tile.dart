import 'package:fast_shopping/features/items/widgets/item_tile/expanded_item_tile.dart';
import 'package:fast_shopping/models/item.dart';
import 'package:flutter/material.dart';

import 'collapsed_item_tile.dart';

class _ItemTileData extends ChangeNotifier {
  _ItemTileData({
    @required Item item,
    ValueChanged<bool> onDoneChanged,
    ValueChanged<String> onTitleChanged,
    VoidCallback onRemoved,
    bool expanded = false,
    @required ValueChanged<bool> onExpandedChanged,
  })  : _item = item,
        _onDoneChanged = onDoneChanged,
        _onTitleChanged = onTitleChanged,
        _onRemoved = onRemoved,
        _expanded = expanded,
        _onExpandedChanged = onExpandedChanged,
        _editing = false;

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
  bool _expanded;
  bool get expanded => _expanded;
  set expanded(bool value) {
    _expanded = value;
    notifyListeners();
  }

  ValueChanged<bool> _onExpandedChanged;
  ValueChanged<bool> get onExpandedChanged => _onExpandedChanged;
  set onExpandedChanged(ValueChanged<bool> value) {
    _onExpandedChanged = value;
    notifyListeners();
  }

  // Local state
  bool _editing;
  bool get editing => _editing;
  set editing(bool value) {
    _editing = value;
    notifyListeners();
  }
}

class ItemTile extends InheritedNotifier<_ItemTileData> {
  ItemTile({
    Key key,
    Item item,
    ValueChanged<bool> onDoneChanged,
    ValueChanged<String> onTitleChanged,
    VoidCallback onRemoved,
    bool expanded = false,
    ValueChanged<bool> onExpandedChanged,
  }) : super(
          key: key,
          notifier: _ItemTileData(
            item: item,
            onDoneChanged: onDoneChanged,
            onTitleChanged: onTitleChanged,
            onRemoved: onRemoved,
            expanded: expanded,
            onExpandedChanged: onExpandedChanged,
          ),
          child: const _ItemTile(),
        );

  static _ItemTileData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ItemTile>().notifier;
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: ItemTile.of(context).expanded
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      firstCurve: Curves.ease,
      secondCurve: Curves.ease,
      sizeCurve: Curves.ease,
      duration: const Duration(milliseconds: 300),
      firstChild: const CollapsedItemTile(),
      secondChild: const ExpandedItemTile(),
    );
  }
}
