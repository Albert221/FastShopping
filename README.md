<img align="left" src="https://i.imgur.com/Jb04dUM.png" alt="">

# Fast shopping

*Fast shopping* is a simple application for easy shopping list making, for 
everyone.

[![Download on Google 
Play](https://play.google.com/intl/en_us/badges/images/badge_new.png)](https://play.google.com/store/apps/details?id=me.wolszon.fastshopping)

## Goal

This application was made to resolve a certain problem in a certain way. 
There are many people that don't want to use a voice assistant and find 
other apps available on the market too much overwhelming, too complex, 
bloated with features, bloated with ads or simply overingeenered for their 
simple problem. In the past, you would get yourself a piece of paper and a 
pen and write down the stuff you need to buy, so you can read it while being 
in the market. *Fast shopping* is an application that does exactly that and 
only that. Reducing number of taps to a minimum and offering a very readable 
interface.

## Features

- adding items to list
- making items complete
- deleting specific items
- deleting all completed items at once

*and that's all!*

![Shopping list. Simply.](https://i.imgur.com/12AiVoL.png)

## Contributing

Everyone is welcome to contribute! But remember the main goal of this app.

If you are into localization of the app, please make use of the 
`intl_translation` package:

```bash
# Generate `intl_messages.arb` from strings in `localization.dart`:
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n \
    lib/localization.dart
# Create `intl_<locale>.arb` files based on `intl_messages.arb`
# and create Dart file using:
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n \
    lib/localization.dart lib/l10n/intl_*.arb --no-use-deferred-loading
```
