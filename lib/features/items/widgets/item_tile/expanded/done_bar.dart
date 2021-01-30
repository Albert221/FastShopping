import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

class DoneBar extends StatelessWidget {
  const DoneBar({
    Key key,
    @required this.item,
    this.onDoneChanged,
    @required this.onExpandedChanged,
  }) : super(key: key);

  final Item item;
  final ValueChanged<bool> onDoneChanged;
  final ValueChanged<bool> onExpandedChanged;

  @override
  Widget build(BuildContext context) {
    final doneColor = DefaultTextStyle.of(context).style.color.withOpacity(.87);

    return InkWell(
      onTap: () => onExpandedChanged(false),
      onLongPress: () {}, // don't handle tap on reordering
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 0, 16, 0),
        child: Row(
          children: [
            Checkbox(
              value: item.done,
              onChanged: onDoneChanged,
            ),
            if (item.done)
              Text(
                S.of(context).list_item_done_ago(item.doneAt.timeAgo(context)),
                style: TextStyle(color: doneColor, fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}
