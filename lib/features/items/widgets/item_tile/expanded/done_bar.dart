import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/l10n/timeago.dart';
import 'package:flutter/material.dart';

import '../item_tile.dart';

class DoneBar extends StatelessWidget {
  const DoneBar({Key key}) : super(key: key);

  static const _doneStyle = TextStyle(
    fontSize: 12,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    final item = ItemTile.of(context).item;

    return InkWell(
      onTap: () => ItemTile.of(context).onExpandedChanged(false),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 0, 16, 0),
        child: Row(
          children: [
            Checkbox(
              value: item.doneAt != null,
              onChanged: ItemTile.of(context).onDoneChanged,
            ),
            if (item.doneAt != null)
              Text(
                S.of(context).list_item_done_ago(item.doneAt.timeAgo(context)),
                style: _doneStyle,
              ),
          ],
        ),
      ),
    );
  }
}
