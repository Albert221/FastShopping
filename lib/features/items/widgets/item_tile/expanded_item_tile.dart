import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'expanded/actions_bar.dart';
import 'expanded/content_space.dart';
import 'expanded/done_bar.dart';

class ExpandedItemTile extends HookWidget {
  const ExpandedItemTile({
    Key key,
    @required this.item,
    this.onDoneChanged,
    this.onTitleChanged,
    this.onRemoved,
    @required this.expanded,
    @required this.onExpandedChanged,
    @required this.editing,
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

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController(text: item.title);

    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Container(
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: Colors.black12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DoneBar(
              item: item,
              onDoneChanged: onDoneChanged,
              onExpandedChanged: onExpandedChanged,
            ),
            ContentSpace(
              titleController: titleController,
              item: item,
              editing: editing,
              onEditingChanged: onEditingChanged,
              onTitleChanged: onTitleChanged,
            ),
            ActionsBar(
              titleController: titleController,
              onTitleChanged: onTitleChanged,
              editing: editing,
              onEditingChanged: onEditingChanged,
              onRemoved: onRemoved,
            ),
          ],
        ),
      ),
    );
  }
}
