import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart' hide SimpleDialog;

class DeleteListDialog extends StatelessWidget {
  const DeleteListDialog({Key key, @required this.listName}) : super(key: key);

  final String listName;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: S.of(context).delete_shopping_list_dialog_title,
      body: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyText2,
          children: [
            TextSpan(
              text: S.of(context).delete_shopping_list_dialog_body_before,
            ),
            TextSpan(
              text: listName,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            TextSpan(
              text: S.of(context).delete_shopping_list_dialog_body_after,
            ),
          ],
        ),
      ),
      primaryButton: DangerFlatButton(
        text: S.of(context).delete_shopping_list_dialog_delete,
        onPressed: () => Navigator.pop(context, true),
      ),
      secondaryButton: SecondaryFlatButton(
        text: S.of(context).delete_shopping_list_dialog_cancel,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
