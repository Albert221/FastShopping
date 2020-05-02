<img align="right" src="android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png" alt="">

# Fast Shopping

[![Get it on Google Play][google_play_button]][google_play]
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FAlbert221%2FFastShopping.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2FAlbert221%2FFastShopping?ref=badge_shield)

**Fast Shopping** is a mobile application developed with simplicity in mind. It allows you on having a simple set of shopping lists, that you can easily manage. It contains **no** ads. Targetted to everyone who wants a simple app to get the job done. Not limited to tech-savy users.

![App screenshots][app_screenshots]

## Goal

This application was made to resolve a certain problem in a certain way. 

There are many people that don't want to use a voice assistant and find other apps available on the market too overwhelming, too complex, bloated with features, bloated with ads or simply overengineered for their simple problem. In the past, you would get yourself a piece of paper and a pen and write down the stuff you need to buy, so you can read it while being in the market. **Fast shopping** is an application that does exactly that and only that. Reducing number of taps to a minimum and offering a very readable interface.

## Building

```bash
git clone git@github.com:Albert221/FastShopping.git && cd FastShopping
flutter packages pub get
flutter packages pub run build_runner build
flutter build apk
# or if you want to build the debug version and run it
flutter run
```

## Translating

If you want to fix translations or maybe add your mother tongue, head to `lib/i18n/messages` folder and copy the `en.json` file to `<your language>.json` and proceed to translating.

Translate the app launcher name too. To do this, create a new folder in `android/app/src/main/res` called `values-<your language>` and put a `strings.xml` file there. For reference, check `android\app\src\main\res\values\strings.xml` file.

### Available languages

- English
- Polish
- Macedonian ([@MatejMecka][matejmecka])

[google_play_button]: https://play.google.com/intl/en_us/badges/images/badge_new.png
[google_play]: https://play.google.com/store/apps/details?id=me.wolszon.fastshopping
[app_screenshots]: https://i.imgur.com/biDOUms.jpg
[matejmecka]: https://github.com/MatejMecka


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FAlbert221%2FFastShopping.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2FAlbert221%2FFastShopping?ref=badge_large)