import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/widgets/buttons.dart';
import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Text(
              'add_item_dialog_title'.i18n,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 18),
            child: TextField(
              controller: _titleController,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                isDense: true,
                hintText: 'list_item_title_hint'.i18n,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              minLines: 1,
              maxLines: 1000,
              onSubmitted: (_) {
                Navigator.pop(context, _titleController.text);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('add_item_dialog_cancel'.i18n),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 8),
                PrimaryFlatButton(
                  text: 'add_item_dialog_add'.i18n,
                  onPressed: () {
                    Navigator.pop(context, _titleController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
