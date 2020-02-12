import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddListDialog extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PromptDialog(
      title: 'Add new shopping list',
      inputHint: 'Write shopping list name here...',
      controller: _controller,
      primaryButton: PrimaryFlatButton(
        text: 'ADD',
        onPressed: () => Navigator.pop(context, _controller.text),
      ),
      onSubmitted: () => Navigator.pop(context, _controller.text),
      secondaryButton: FlatButton(
        child: Text('CANCEL'),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
