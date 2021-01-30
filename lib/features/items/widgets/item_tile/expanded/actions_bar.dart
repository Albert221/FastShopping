import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

class ActionsBar extends StatelessWidget {
  const ActionsBar({
    Key key,
    @required this.titleController,
    @required this.editing,
    this.onTitleChanged,
    this.onRemoved,
    @required this.onEditingChanged,
  }) : super(key: key);

  final TextEditingController titleController;
  final bool editing;
  final ValueChanged<String> onTitleChanged;
  final VoidCallback onRemoved;
  final ValueChanged<bool> onEditingChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onRemoved,
            child: Text(S.of(context).list_item_remove),
          ).danger,
          const Spacer(),
          if (editing)
            _EditActions(
              titleController: titleController,
              onTitleChanged: onTitleChanged,
              onEditingChanged: onEditingChanged,
            )
          else
            TextButton.icon(
              onPressed: () => onEditingChanged(true),
              icon: const Icon(Icons.edit, size: 16),
              label: Text(S.of(context).list_item_edit),
            ).primary,
        ],
      ),
    );
  }
}

class _EditActions extends StatelessWidget {
  const _EditActions({
    Key key,
    @required this.titleController,
    this.onTitleChanged,
    @required this.onEditingChanged,
  }) : super(key: key);

  final TextEditingController titleController;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<bool> onEditingChanged;

  void _onCancel(BuildContext context) {
    onEditingChanged(false);
  }

  void _onSave(BuildContext context) {
    onEditingChanged(false);
    onTitleChanged?.call(titleController.text);
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
