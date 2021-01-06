# Translating

If you want to contribute to Fast Shopping by adding support for your language or by fixing/updating the already existing one, you're reading the right file.

Translations for the strings inside the application itself are stored and maintained with [Arbify].

## Contributing to translations

You can contribute to translating Fast Shopping in one of two ways, depending on your technical skills and the effort you're willing to make.

### Non technical way

[Create a new issue][translation-issue] using the _Translation_ template and fill all the blanks. Also, I'll need your email to create an account for you in Arbify, so you can start translating the app.

After you create the issue, please email me at fastshopping@wolszon.me so I can create you an Arbify account. Once you'll receive the account activation link, you can proceed to translating the strings.

Once you'll be done, comment on the issue and tell me so.

After that, I'll take care of the rest. Including putting you in the _Available languages_ section in the [README.md] :)

### Technical way

Firstly, I'll need your email to create an account for you in Arbify. Email me at fastshopping@wolszon.me.

After you've forked the project, create the directories and files below and fill them with the strings:

```
.
├── android/app/src/main/res
│   └── values-<your-language>
│       └── strings.xml
└── fastlane/metadata
    └── <your-language>
        ├── full_description.txt
        ├── short_description.txt
        └── title.txt
```

Remember about the character limits for each of those:

| App title         | Short description | Full description    |
|-------------------|-------------------|---------------------|
| Max 50 characters | Max 80 characters | Max 4000 characters |

After you are done with strings in Arbify, run the following command:

```bash
flutter pub run arbify:download
```

#### Generating store listing images

Optional, if you don't do this, I'll do it.

You need a Pixel 2 XL emulator with API 28 (Android 9) to generate the screenshots of correct dimensions.

```bash
flutter drive --target=test_driver/screenshots.dart
```

After all of those step, you can submit a Pull Request. Don't forget to add yourself to the [README.md] _Available languages_ section!

[Arbify]: https://github.com/Arbify/Arbify
[translation-issue]: https://github.com/Albert221/FastShopping/issues/new?assignees=&labels=i18n&template=translation.md&title=
[README.md]: README.md
