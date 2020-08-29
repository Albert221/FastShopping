import 'package:fast_shopping/l10n/timeago/mk_messages.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

extension TimeAgoI18n on DateTime {
  String timeAgo(BuildContext context) {
    timeago.setLocaleMessages('de', timeago.DeMessages());
    timeago.setLocaleMessages('mk', MkMessages());
    timeago.setLocaleMessages('pl', timeago.PlMessages());

    return timeago.format(
      this,
      locale: Localizations.localeOf(context).languageCode,
    );
  }
}
