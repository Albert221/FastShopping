import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';

class NoArchivedListsPlaceholder extends StatelessWidget {
  const NoArchivedListsPlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.of(context).no_archived_lists_message),
    );
  }
}
