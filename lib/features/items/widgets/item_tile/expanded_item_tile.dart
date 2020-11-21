import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'expanded/actions_bar.dart';
import 'expanded/content_space.dart';
import 'expanded/done_bar.dart';
import 'item_tile.dart';

class ExpandedItemTile extends HookWidget {
  const ExpandedItemTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController(
      text: ItemTile.of(context).item.title,
    );

    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Container(
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: Colors.black12),
          ),
        ),
        child: Column(
          children: [
            const DoneBar(),
            ContentSpace(titleController: titleController),
            ActionsBar(titleController: titleController),
          ],
        ),
      ),
    );
  }
}
