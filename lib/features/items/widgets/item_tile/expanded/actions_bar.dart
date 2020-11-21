import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';

import '../item_tile.dart';

class ActionsBar extends StatelessWidget {
  const ActionsBar({Key key, @required this.titleController}) : super(key: key);

  final TextEditingController titleController;

  void _onEdit(BuildContext context) {
    ItemTile.of(context).editing = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: ItemTile.of(context).onRemoved,
            child: Text(S.of(context).list_item_remove),
          ).danger,
          const Spacer(),
          if (ItemTile.of(context).editing)
            _EditActions(titleController: titleController)
          else
            TextButton.icon(
              onPressed: () => _onEdit(context),
              icon: const Icon(Icons.edit, size: 16),
              label: Text(S.of(context).list_item_edit),
            ).primary,
        ],
      ),
    );
  }
}

class _EditActions extends StatelessWidget {
  const _EditActions({Key key, @required this.titleController})
      : super(key: key);

  final TextEditingController titleController;

  void _onCancel(BuildContext context) {
    ItemTile.of(context).editing = false;
  }

  void _onSave(BuildContext context) {
    ItemTile.of(context)
      ..editing = false
      ..onTitleChanged?.call(titleController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => _onCancel(context),
          child: Text(S.of(context).list_item_editing_cancel),
        ),
        const SizedBox(width: 16),
        TextButton(
          onPressed: () => _onSave(context),
          child: Text(S.of(context).list_item_editing_save),
        ).primary,
      ],
    );
  }
}
