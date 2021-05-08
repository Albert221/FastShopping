import 'package:fast_shopping/features/common/prompt_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PromptDialog(
      title: S.of(context)!.add_item_dialog_title,
      inputHint: S.of(context)!.list_item_title_hint,
      submitText: S.of(context)!.add_item_dialog_add,
      cancelText: S.of(context)!.add_item_dialog_cancel,
    );
  }
}
