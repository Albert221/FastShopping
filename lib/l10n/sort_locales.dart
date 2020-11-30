import 'dart:ui';

extension SortLocalesExtension on List<Locale> {
  List<Locale> get sortLocales {
    return List.of(this)
      ..sort((a, b) {
        final aEn = a.languageCode == 'en';
        final bEn = b.languageCode == 'en';

        if (aEn && bEn) return 0;
        if (aEn) return -1;
        return 1;
      });
  }
}
