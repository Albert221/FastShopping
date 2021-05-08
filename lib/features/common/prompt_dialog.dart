import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PromptDialog extends HookWidget {
  const PromptDialog({
    Key? key,
    required this.title,
    required this.submitText,
    this.cancelText,
    this.inputHint,
    this.initialValue = '',
  }) : super(key: key);

  final String title;
  final String submitText;
  final String? cancelText;
  final String? inputHint;
  final String initialValue;

  void _onSubmit(BuildContext context, TextEditingController controller) {
    Navigator.of(context).pop(controller.text);
  }

  void _onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue);

    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 18),
              child: TextField(
                controller: controller,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
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
                onSubmitted: (_) => _onSubmit(context, controller),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (cancelText != null)
                    TextButton(
                      key: const Key('cancel-dialog'),
                      onPressed: () => _onCancel(context),
                      child: Text(cancelText!),
                    ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => _onSubmit(context, controller),
                    child: Text(submitText),
                  ).primary,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
