import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget wrapper(Widget widget) {
  return MaterialApp(
    localizationsDelegates: S.localizationsDelegates,
    locale: const Locale('en'),
    home: widget,
  );
}
