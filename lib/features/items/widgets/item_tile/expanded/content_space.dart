import 'dart:async';

import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
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

  VoidCallback Function() _onItemOrEditingUpdate(
    BuildContext context,
    FocusScopeNode focusScopeNode,
    FocusNode focusNode,
  ) {
    final debounce = useState<Timer>(null);

    return () {
      // Focus or unfocus title field based on the item tile state
      if (editing && !focusNode.hasFocus) {
        focusScopeNode.requestFocus(focusNode);
      } else if (!editing && focusNode.hasFocus) {
        focusScopeNode.unfocus();
      }

      // Debounce so that the user doesn't see flickering because of how the
      // states are emitted:
      //     editing item -> not editing item -> not editing item with new title
      // will become:
      //     editing item -> not editing item with new title
      // TODO: Add debouncing (ideally conditional) to the SelectedShoppingListCubit
      //       after migrating to bloc 7.0.0 (transformTransitions in cubits).
      if (debounce.value?.isActive ?? false) debounce.value.cancel();
      debounce.value = Timer(const Duration(milliseconds: 50), () {
        titleController.value = TextEditingValue(
          text: item.title,
          selection: TextSelection.collapsed(offset: item.title.length),
        );
      });

      return () => debounce.value?.cancel();
    };
  }

  void _onEdit(BuildContext context) {
    if (!editing) {
      onEditingChanged(true);
    }
  }

  void _onTitleSubmit(BuildContext context, String title) {
    onEditingChanged(false);
    onTitleChanged?.call(title);
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    useEffect(
      _onItemOrEditingUpdate(
        context,
        FocusScope.of(context),
        focusNode,
      ),
      [item, editing],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
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
