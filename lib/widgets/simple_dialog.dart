import 'package:flutter/material.dart';

class SimpleDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget primaryButton;
  final Widget secondaryButton;

  const SimpleDialog({
    Key key,
    @required this.title,
    @required this.body,
    @required this.primaryButton,
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
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 18),
            child: body,
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
