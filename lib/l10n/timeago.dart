import 'package:fast_shopping/l10n/timeago/mk_messages.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

void setupTimeagoMessages() {
  timeago.setLocaleMessages('de', timeago.DeMessages());
  timeago.setLocaleMessages('mk', MkMessages());
  timeago.setLocaleMessages('pl', timeago.PlMessages());
  timeago.setLocaleMessages('ru', timeago.RuMessages());
  timeago.setLocaleMessages('fr', timeago.FrMessages());
  timeago.setLocaleMessages('it', timeago.ItMessages());
  timeago.setLocaleMessages('nl', timeago.NlMessages());
  timeago.setLocaleMessages('es', timeago.EsMessages());
}

extension TimeAgoI18n on DateTime {
  String timeAgo(BuildContext context) {
    return timeago.format(
      this,
      locale: Localizations.localeOf(context).languageCode,
    );
  }
}
