import 'package:devicelocale/devicelocale.dart';
import 'package:fast_shopping/i18n/i18n.dart';
import 'package:flutter/material.dart';

class I18nBuilder extends StatelessWidget {
  final Widget placeholder;
  final WidgetBuilder builder;

  const I18nBuilder({
    Key key,
    @required this.placeholder,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Devicelocale.preferredLanguages,
      builder: (_, locales) {
        return locales.hasData
            ? FutureBuilder(
                future: FastShoppingI18n().init(
                  List<String>.from(locales.data),
                ),
                builder: (_, future) {
                  return !future.hasError
                      ? Builder(builder: builder)
                      : placeholder;
                },
              )
            : placeholder;
      },
    );
  }
}
