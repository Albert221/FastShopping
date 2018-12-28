import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fast_shopping/l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;

      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  static AppLocalizationsDelegate get delegate => AppLocalizationsDelegate();

  String get appTitle => Intl.message('Fast shopping',
      name: 'appTitle', desc: 'Application title.');

  String get navigationTitle => Intl.message('Shopping list',
      name: 'navigationTitle',
      desc: 'Title displayed on top of the main screen.');

  String get purchasesPlaceholder =>
      Intl.message('You have no items on your list.',
          name: 'purchasesPlaceholder');

  String get purchaseDialogTitle =>
      Intl.message('Add item', name: 'purchaseDialogTitle');

  String get purchaseDialogInputPlaceholder =>
      Intl.message('White sugar', name: 'purchaseDialogInputPlaceholder');

  String get purchaseDialogInputNotEmpty =>
      Intl.message('Item name cannot be blank',
          name: 'purchaseDialogInputNotEmpty');

  String get purchaseDialogAdd =>
      Intl.message('Add', name: 'purchaseDialogAdd');

  String get deleteDialogTitle =>
      Intl.message('Deleting', name: 'deleteDialogTitle');

  String get deleteDialogDescriptionOne =>
      Intl.message('Are you sure you want to delete this item?',
          name: 'deleteDialogDescriptionOne',
          desc: 'Description in alert when deleting one item.');

  String get deleteDialogDescriptionCompleted =>
      Intl.message('Are you sure you want to delete completed items?',
          name: 'deleteDialogDescriptionCompleted',
          desc: 'Description in alert when deleting completed items.');

  String get deleteDialogCancel =>
      Intl.message('Cancel', name: 'deleteDialogCancel');

  String get deleteDialogConfirm =>
      Intl.message('Delete', name: 'deleteDialogConfirm');

  String get deletedSnackbarText =>
      Intl.message('You have deleted an item.', name: 'deletedSnackbarText');

  String get deletedAllSnackbarText =>
      Intl.message('You have deleted all completed purchases.',
          name: 'deletedAllSnackbarText');

  String get undo => Intl.message('Undo', name: 'undo');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pl'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
