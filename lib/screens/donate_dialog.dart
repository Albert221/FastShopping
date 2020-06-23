import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart' hide SimpleDialog;
import 'package:url_launcher/url_launcher.dart';

class DonateDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: S.of(context).donate_dialog_title,
      body: Text(S.of(context).donate_dialog_body),
      primaryButton: PrimaryFlatButton(
        text: S.of(context).donate_dialog_paypal,
        onPressed: () => launch('https://www.paypal.me/Albert221'),
      ),
    );
  }
}
