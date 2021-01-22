import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

Widget wrapper(Widget widget) {
  return MaterialApp(
    localizationsDelegates: S.localizationsDelegates,
    locale: const Locale('en'),
    home: widget,
  );
}
