import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RenameListDialog extends StatelessWidget {
  RenameListDialog({Key key, this.initialName = ''})
      : _controller = TextEditingController.fromValue(
          TextEditingValue(
            text: initialName,
            selection: TextSelection.collapsed(offset: initialName.length),
          ),
        ),
        super(key: key);

  final String initialName;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return PromptDialog(
      title: S.of(context).rename_shopping_list_dialog_title,
      inputHint: S.of(context).rename_shopping_list_dialog_name_hint,
      controller: _controller,
      primaryButton: PrimaryFlatButton(
        text: S.of(context).rename_shopping_list_dialog_rename,
        onPressed: () => Navigator.pop(context, _controller.text),
      ),
      secondaryButton: SecondaryFlatButton(
        text: S.of(context).rename_shopping_list_dialog_cancel,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
