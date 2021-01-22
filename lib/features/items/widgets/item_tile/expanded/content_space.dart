import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ContentSpace extends HookWidget {
  const ContentSpace({
    Key key,
    @required this.titleController,
    @required this.item,
    @required this.editing,
    @required this.onEditingChanged,
    this.onTitleChanged,
  }) : super(key: key);

  final TextEditingController titleController;

  final Item item;
  final bool editing;
  final ValueChanged<bool> onEditingChanged;
  final ValueChanged<String> onTitleChanged;

  void _onItemTileUpdate(
    BuildContext context, {
    @required FocusNode focusNode,
    @required bool previousEditing,
  }) {
    // Focus or unfocus title field based on the item tile state
    if (editing) {
      FocusScope.of(context).requestFocus(focusNode);
    } else if (focusNode.hasFocus) {
      FocusScope.of(context).unfocus();
    }

    // Update the title field value if the editing state changed so we don't
    // lose the title that is being composed.
    if (previousEditing != editing) {
      titleController.value = TextEditingValue(
        text: item.title,
        selection: TextSelection.collapsed(offset: item.title.length),
      );
    }
  }

  void _onEdit(BuildContext context) {
    onEditingChanged(true);
  }

  void _onTitleSubmit(BuildContext context, String title) {
    onEditingChanged(false);
    onTitleChanged?.call(title);
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final previousEditing = usePrevious(editing);

    _onItemTileUpdate(
      context,
      focusNode: focusNode,
      previousEditing: previousEditing,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
          hintText: editing
              ? S.of(context).list_item_title_hint
              : S.of(context).list_item_no_name,
          hintStyle: TextStyle(
            fontStyle: editing ? FontStyle.normal : FontStyle.italic,
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        minLines: 1,
        maxLines: 1000,
        readOnly: !editing,
        controller: titleController,
        focusNode: focusNode,
        onTap: () => _onEdit(context),
        onSubmitted: (title) => _onTitleSubmit(context, title),
      ),
    );
  }
}
