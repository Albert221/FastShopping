import 'package:flutter/widgets.dart';

class OverrideLocale extends InheritedWidget {
  const OverrideLocale({
    Key? key,
    required this.locale,
    required Widget child,
  }) : super(key: key, child: child);

  final Locale locale;

  static Locale? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<OverrideLocale>()?.locale;

  @override
  bool updateShouldNotify(OverrideLocale oldWidget) =>
      locale != oldWidget.locale;
}
