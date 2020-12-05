import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter/material.dart';
import 'package:list_diff/list_diff.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({
    Key key,
    @required this.items,
    @required this.itemBuilder,
    this.padding,
  })  : assert(items != null),
        super(key: key);

  final List<Item> items;
  final Widget Function(Item) itemBuilder;
  final EdgeInsets padding;

  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState<T> extends State<ItemsList> {
  final listKey = GlobalKey<SliverAnimatedListState>();

  @override
  void didUpdateWidget(ItemsList oldWidget) {
    super.didUpdateWidget(oldWidget);

    final operations = diffSync(
      oldWidget.items.map((item) => item.id).toList(),
      widget.items.map((item) => item.id).toList(),
    );

    _animateList(oldWidget, operations);
  }

  void _animateList(
    ItemsList oldWidget,
    List<Operation> operations,
  ) {
    for (final operation in operations) {
      if (operation.isInsertion) {
        listKey.currentState.insertItem(operation.index);
      } else {
        listKey.currentState.removeItem(
          operation.index,
          (context, animation) {
            final oldItem = oldWidget.items.firstWhere(
              (item) => item.id == operation.item,
            );

            return _buildItem(context, oldItem, animation, false);
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: widget.padding,
      sliver: SliverAnimatedList(
        key: listKey,
        initialItemCount: widget.items.length,
        itemBuilder: (context, i, animation) =>
            _buildItem(context, widget.items[i], animation, true),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    Item item,
    Animation<double> animation,
    bool adding,
  ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        if (animation.value == 1) {
          return child;
        }

        return ClipRect(
          child: Align(
            alignment: adding ? Alignment.topCenter : Alignment.bottomCenter,
            heightFactor: animation.value,
            child: Opacity(
              opacity: animation.value,
              child: IgnorePointer(child: child),
            ),
          ),
        );
      },
      child: widget.itemBuilder(item),
    );
  }
}
