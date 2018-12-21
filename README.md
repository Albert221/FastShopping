# shopping_list

Very simple and straightforward shopping list application.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).


## Localization

Add message to `lib/localization.dart` file, then run

    flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localization.dart

add missing translations to locale files from `lib/l10n/intl_messages.arb` and run

    flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n lib/localization.dart lib/l10n/intl_en.arb lib/l10n/intl_pl.arb --no-use-deferred-loading
