import 'package:fast_shopping/localization.dart';
import 'package:flutter/material.dart';

class PurchaseDialog extends StatefulWidget {
  @override
  _PurchaseDialogState createState() => _PurchaseDialogState();
}

class _PurchaseDialogState extends State<PurchaseDialog> {
  final _formKey = GlobalKey<FormState>();

  String _purchaseName;

  void _submitDialog(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Navigator.of(context).pop(_purchaseName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text(AppLocalizations.of(context).purchaseDialogTitle),
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(children: [
                Form(
                    key: _formKey,
                    child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        autofocus: true,
                        maxLength: 25,
                        onSaved: (value) => _purchaseName = value,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context)
                                .purchaseDialogInputNotEmpty;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)
                                .purchaseDialogInputPlaceholder))),
                const SizedBox(height: 16.0),
                Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                        onPressed: () => _submitDialog(context),
                        child: Text(AppLocalizations.of(context)
                            .purchaseDialogAdd
                            .toUpperCase()),
                        color: Theme.of(context).accentColor))
              ]))
        ]);
  }
}
