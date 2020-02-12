import 'package:flutter/material.dart';

class PromptDialog extends StatelessWidget {
  final String title;
  final String inputHint;
  final Widget primaryButton;
  final TextEditingController controller;
  final VoidCallback onSubmitted;
  final Widget secondaryButton;

  PromptDialog({
    Key key,
    @required this.title,
    @required this.inputHint,
    @required this.primaryButton,
    this.controller,
    this.onSubmitted,
    this.secondaryButton,
  }) : super(key: key);

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
              title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 18),
            child: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                isDense: true,
                hintText: inputHint,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              minLines: 1,
              maxLines: 1000,
              onSubmitted: (_) => onSubmitted?.call(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (secondaryButton != null) secondaryButton,
                const SizedBox(width: 8),
                primaryButton,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
