import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart' hide SimpleDialog;
import 'package:url_launcher/url_launcher.dart';

class DonateDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: 'donate_dialog_title'.i18n,
      body: Text('donate_dialog_body'.i18n),
      primaryButton: PrimaryFlatButton(
        text: 'donate_dialog_paypal'.i18n,
        onPressed: () => launch('https://www.paypal.me/Albert221'),
      ),
    );
  }
}
