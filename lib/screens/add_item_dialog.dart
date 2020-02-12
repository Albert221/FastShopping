import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PromptDialog(
      title: 'add_item_dialog_title'.i18n,
      inputHint: 'list_item_title_hint'.i18n,
      controller: _titleController,
      primaryButton: PrimaryFlatButton(
        text: 'add_item_dialog_add'.i18n,
        onPressed: () => Navigator.pop(context, _titleController.text),
      ),
      onSubmitted: () => Navigator.pop(context, _titleController.text),
      secondaryButton: FlatButton(
        child: Text('add_item_dialog_cancel'.i18n),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
