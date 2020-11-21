import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../item_tile.dart';

class ContentSpace extends HookWidget {
  const ContentSpace({Key key, @required this.titleController})
      : super(key: key);

  final TextEditingController titleController;

  void _onItemTileUpdate(
    BuildContext context, {
    @required FocusNode focusNode,
    @required ItemTileData previousItemTile,
  }) {
    final itemTile = ItemTile.of(context);

    // Focus or unfocus title field based on the item tile state
    if (itemTile.editing) {
      FocusScope.of(context).requestFocus(focusNode);
    } else if (focusNode.hasFocus) {
      FocusScope.of(context).unfocus();
    }

    // Update the title field value if the editing state changed so we don't
    // lose the title that is being composed.
    if (previousItemTile?.editing != itemTile.editing) {
      titleController.value = TextEditingValue(
        text: itemTile.item.title,
        selection: TextSelection.collapsed(offset: itemTile.item.title.length),
      );
    }
  }

  void _onEdit(BuildContext context) {
    ItemTile.of(context).onEditingChanged(true);
  }

  void _onTitleSubmit(BuildContext context, String title) {
    ItemTile.of(context)
      ..onEditingChanged(false)
      ..onTitleChanged?.call(title);
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final previousItemTile = usePrevious(ItemTile.of(context));

    _onItemTileUpdate(
      context,
      focusNode: focusNode,
      previousItemTile: previousItemTile,
    );

    final editing = ItemTile.of(context).editing;

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
