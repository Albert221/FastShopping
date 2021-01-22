import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoArchivedListsPlaceholder extends StatelessWidget {
  const NoArchivedListsPlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.of(context).no_archived_lists_message),
    );
  }
}
