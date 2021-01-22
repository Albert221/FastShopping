import 'package:fast_shopping/features/common/prompt_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

class RenameListDialog extends StatelessWidget {
  const RenameListDialog({Key key, this.initialName = ''}) : super(key: key);

  final String initialName;

  @override
  Widget build(BuildContext context) {
    return PromptDialog(
      initialValue: initialName,
      title: S.of(context).rename_shopping_list_dialog_title,
      inputHint: S.of(context).rename_shopping_list_dialog_name_hint,
      submitText: S.of(context).rename_shopping_list_dialog_rename,
      cancelText: S.of(context).rename_shopping_list_dialog_cancel,
    );
  }
}
