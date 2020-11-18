import 'dart:ui';

import 'package:flutter_driver/driver_extension.dart';
import 'package:fast_shopping/main.dart' as app;
import 'package:intl/locale.dart' as intl;

void main() {
  enableFlutterDriverExtension(
    handler: (payload) {
      if (payload.startsWith('locale-')) {
        final localeString = payload.split('locale-').last;
        final locale = intl.Locale.parse(localeString);
        final dartLocale = Locale.fromSubtags(
          languageCode: locale.languageCode,
          countryCode: locale.countryCode,
          scriptCode: locale.scriptCode,
        );

        app.main(dartLocale);
      }

      return null;
    },
  );

  app.main();
}
