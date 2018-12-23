import 'package:fast_shopping/localization.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key key, this.all = false}) : super(key: key);

  final bool all;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(AppLocalizations.of(context).deleteDialogTitle),
        content: Text(all
            ? AppLocalizations.of(context).deleteDialogDescriptionCompleted
            : AppLocalizations.of(context).deleteDialogDescriptionOne),
        actions: [
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                  AppLocalizations.of(context).deleteDialogCancel.toUpperCase(),
                  style: const TextStyle(color: Colors.black87))),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                  AppLocalizations.of(context)
                      .deleteDialogConfirm
                      .toUpperCase(),
                  style: const TextStyle(color: Colors.black87)),
              color: Theme.of(context).accentColor)
        ]);
  }
}
