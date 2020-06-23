import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddListDialog extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PromptDialog(
      title: S.of(context).add_list_dialog_title,
      inputHint: S.of(context).add_list_dialog_name_hint,
      controller: _controller,
      primaryButton: PrimaryFlatButton(
        text: S.of(context).add_list_dialog_add,
        onPressed: () => Navigator.pop(context, _controller.text),
      ),
      onSubmitted: () => Navigator.pop(context, _controller.text),
      secondaryButton: SecondaryFlatButton(
        text: S.of(context).add_list_dialog_cancel,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
