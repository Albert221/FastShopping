import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart' hide SimpleDialog;
import 'package:url_launcher/url_launcher.dart';

class SupportAuthorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: S.of(context).support_author_dialog_title,
      body: Text(S.of(context).support_author_dialog_body),
      primaryButton: PrimaryFlatButton(
        text: S.of(context).support_author_dialog_button,
        onPressed: () => launch('https://wolszon.me/support-me'),
      ),
    );
  }
}
