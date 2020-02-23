import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RenameListDialog extends StatelessWidget {
  final String initialName;
  final TextEditingController _controller;

  RenameListDialog({Key key, this.initialName = ''})
      : _controller = TextEditingController.fromValue(
          TextEditingValue(
            text: initialName,
            selection: TextSelection.collapsed(offset: initialName.length),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PromptDialog(
      title: 'rename_shopping_list_dialog_title'.i18n,
      inputHint: 'rename_shopping_list_dialog_name_hint'.i18n,
      controller: _controller,
      primaryButton: PrimaryFlatButton(
        text: 'rename_shopping_list_dialog_rename'.i18n,
        onPressed: () => Navigator.pop(context, _controller.text),
      ),
      secondaryButton: SecondaryFlatButton(
        text: 'rename_shopping_list_dialog_cancel'.i18n,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
