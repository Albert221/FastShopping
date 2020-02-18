import 'package:fast_shopping/i18n/i18n.dart';
import 'package:timeago/timeago.dart' as timeago;

extension I18n on String {
  String get i18n => FastShoppingI18n().message(this);

  String i18nFormat(List<dynamic> strings) {
    String message = FastShoppingI18n().message(this);

    return _format(message, strings);
  }

  String _format(String original, List<dynamic> strings) {
    strings.asMap().forEach((i, string) {
      original = original.replaceAll(
        '\$' + (i + 1).toString(),
        string.toString(),
      );
    });

    return original;
  }

  String i18nNumber(num number) {
    final message = FastShoppingI18n().message(this);

    final parts = message.split(r'|');

    if (number == 0) {
      return parts[0];
    } else if (number == 1) {
      return parts[1];
    } else {
      return _format(parts[2], [number]);
    }
  }
}

extension TimeAgoI18n on DateTime {
  String timeAgo() =>
      timeago.format(this, locale: FastShoppingI18n().preferredLocale);
}
