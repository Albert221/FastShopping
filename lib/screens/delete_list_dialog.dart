import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart' hide SimpleDialog;

class DeleteListDialog extends StatelessWidget {
  final String listName;

  const DeleteListDialog({Key key, @required this.listName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: 'delete_shopping_list_dialog_title'.i18n,
      body: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyText2,
          children: [
            TextSpan(
              text: 'delete_shopping_list_dialog_body_before'.i18n,
            ),
            TextSpan(
              text: listName,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            TextSpan(
              text: 'delete_shopping_list_dialog_body_after'.i18n,
            ),
          ],
        ),
      ),
      primaryButton: DangerFlatButton(
        text: 'delete_shopping_list_dialog_delete'.i18n,
        onPressed: () => Navigator.pop(context, true),
      ),
      secondaryButton: SecondaryFlatButton(
        text: 'delete_shopping_list_dialog_cancel'.i18n,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
