import 'package:fast_shopping/i18n/i18n.dart';

extension I18n on String {
  String get i18n => FastShoppingI18n().message(this);

  String i18nFormat(List<dynamic> strings) {
    String message = FastShoppingI18n().message(this);

    strings.asMap().forEach((i, string) {
      message = message.replaceAll('\$' + (i + 1).toString(), string);
    });

    return message;
  }
}
