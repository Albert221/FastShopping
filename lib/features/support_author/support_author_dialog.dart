import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportAuthorDialog extends StatelessWidget {
  const SupportAuthorDialog({Key key}) : super(key: key);

  static const _supportAuthorUrl = 'https://wolszon.me/support-me';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).support_author_dialog_title),
      content: Text(S.of(context).support_author_dialog_body),
      actions: [
        TextButton(
          onPressed: () => launch(_supportAuthorUrl),
          child: Text(S.of(context).support_author_dialog_button),
        ).primary,
      ],
    );
  }
}
