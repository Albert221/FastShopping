import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key key, this.all = false}) : super(key: key);

  final bool all;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Usuwanie'),
        content: Text(all
            ? 'Czy na pewno chcesz wszystko usunąć?'
            : 'Czy na pewno chcesz usunąć?'),
        actions: [
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('ANULUJ',
                  style: const TextStyle(color: Colors.black87))),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('USUŃ',
                  style: const TextStyle(color: Colors.black87)),
              color: Theme.of(context).accentColor)
        ]);
  }
}
