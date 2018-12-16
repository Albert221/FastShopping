import 'package:flutter/material.dart';

class PurchaseDialog extends StatefulWidget {
  const PurchaseDialog({Key key, this.initialName}) : super(key: key);

  final String initialName;

  bool get isEdit => initialName != null;

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
        title: Text(widget.isEdit ? 'Edytuj produkt' : 'Dodaj produkt'),
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(children: [
                Form(
                    key: _formKey,
                    child: TextFormField(
                        initialValue: widget.initialName,
                        maxLength: 25,
                        onSaved: (value) => _purchaseName = value,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Nazwa produktu nie może być pusta';
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: 'Np. 5dag cukru białego'))),
                const SizedBox(height: 16.0),
                Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                        onPressed: () => _submitDialog(context),
                        child: const Text('DODAJ',
                            style: const TextStyle(color: Colors.white)),
                        color: Theme.of(context).accentColor))
              ]))
        ]);
  }
}
