import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';

class RemoveAllDoneDialog extends StatelessWidget {
  const RemoveAllDoneDialog({Key key, @required this.itemsCount})
      : super(key: key);

  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(S.of(context).remove_all_done_dialog_title),
      content: Text(S.of(context).remove_all_done_dialog_body(itemsCount)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(S.of(context).remove_all_done_dialog_cancel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(S.of(context).remove_all_done_dialog_remove),
        ).danger,
      ],
    );
  }
}
