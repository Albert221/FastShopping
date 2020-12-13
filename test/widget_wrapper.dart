import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget wrapper(Widget widget) {
  return MaterialApp(
    localizationsDelegates: const [S.delegate],
    locale: const Locale('en'),
    home: widget,
  );
}
