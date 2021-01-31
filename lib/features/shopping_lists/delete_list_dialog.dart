import 'package:fast_shopping/theme.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

class DeleteListDialog extends StatelessWidget {
  const DeleteListDialog({
    Key key,
    @required this.shoppingList,
  }) : super(key: key);

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    const divider = r'$$DIVIDER$$';
    final bodyParts =
        S.of(context).delete_shopping_list_dialog_body(divider).split(divider);
    final bodyBefore = bodyParts.first;
    final bodyAfter = bodyParts.last;

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(S.of(context).delete_shopping_list_dialog_title),
      content: Text.rich(TextSpan(children: [
        TextSpan(text: bodyBefore),
        TextSpan(
          text: shoppingList.name,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
        TextSpan(text: bodyAfter),
      ])),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(S.of(context).delete_shopping_list_dialog_cancel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(S.of(context).delete_shopping_list_dialog_delete),
        ).danger,
      ],
    );
  }
}
