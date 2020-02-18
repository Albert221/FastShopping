import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddListDialog extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PromptDialog(
      title: 'add_list_dialog_title'.i18n,
      inputHint: 'add_list_dialog_name_hint'.i18n,
      controller: _controller,
      primaryButton: PrimaryFlatButton(
        text: 'add_list_dialog_add'.i18n,
        onPressed: () => Navigator.pop(context, _controller.text),
      ),
      onSubmitted: () => Navigator.pop(context, _controller.text),
      secondaryButton: SecondaryFlatButton(
        text: 'add_list_dialog_cancel'.i18n,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
