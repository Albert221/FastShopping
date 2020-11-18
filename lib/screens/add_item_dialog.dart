import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PromptDialog(
      title: S.of(context).add_item_dialog_title,
      inputHint: S.of(context).list_item_title_hint,
      controller: _titleController,
      primaryButton: PrimaryFlatButton(
        text: S.of(context).add_item_dialog_add,
        onPressed: () => Navigator.pop(context, _titleController.text),
      ),
      onSubmitted: () => Navigator.pop(context, _titleController.text),
      secondaryButton: FlatButton(
        key: const ValueKey('add_item_back'),
        onPressed: () => Navigator.pop(context),
        child: Text(S.of(context).add_item_dialog_cancel),
      ),
    );
  }
}
