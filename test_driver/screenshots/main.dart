import 'dart:ui';

import 'package:fast_shopping/app.dart';
import 'package:fast_shopping/l10n/override_locale.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:fast_shopping/l10n/l10n.dart';
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

        _main(dartLocale);
      }

      return null;
    },
  );
}

void _main(Locale locale) {
  final repository = ScreenshotsShoppingListRepository(locale);

  runApp(OverrideLocale(
    key: UniqueKey(),
    locale: locale,
    child: FastShoppingApp(
      appSettingsRepository: NullAppSettingsRepository(),
      shoppingListRepository: repository,
    ),
  ));
}

class NullAppSettingsRepository extends AppSettingsRepository {
  @override
  Future<ShoppingListsMode> getShoppingListsMode() async => null;
  @override
  Future<void> saveShoppingListsMode(
    ShoppingListsMode shoppingListsMode,
  ) async {}

  @override
  Future<DarkTheme> getDarkTheme() async => null;
  @override
  Future<void> saveDarkTheme(DarkTheme darkTheme) async {}

  @override
  Future<ItemsLayout> getItemsLayout() async => null;
  @override
  Future<void> saveItemsLayout(ItemsLayout itemsLayout) async {}

  @override
  Future<bool> getMoveDoneToEnd() async => null;
  @override
  Future<void> saveMoveDoneToEnd(bool moveDoneToEnd) async {}
}

class ScreenshotsShoppingListRepository extends ShoppingListRepository {
  ScreenshotsShoppingListRepository(this._locale);

  static const _selectedListId = '3964c54a-2d61-441d-8875-fb3e92de927a';

  final Locale _locale;

  @override
  Future<String> getSelectedListId() async => _selectedListId;

  @override
  Future<List<ShoppingList>> getLists() async {
    final twoMinutesAgo =
        DateTime.now().toUtc().subtract(const Duration(minutes: 2));
    final yesterday = DateTime.now().toUtc().subtract(const Duration(days: 1));
    final threeDaysAgo =
        DateTime.now().toUtc().subtract(const Duration(days: 3));

    final s = await S.delegate.load(_locale);

    return [
      ShoppingList(
        id: _selectedListId,
        name: s.screenshot_list_1,
        createdAt: yesterday,
        items: [
          Item(
            id: '00',
            title: s.screenshot_item_1,
          ),
          Item(
            id: '01',
            title: s.screenshot_item_2,
            doneAt: twoMinutesAgo,
          ),
          Item(
            id: '02',
            title: s.screenshot_item_3,
            doneAt: twoMinutesAgo,
          ),
          Item(
            id: '03',
            title: s.screenshot_item_4,
          ),
          Item(
            id: '04',
            title: s.screenshot_item_5,
            doneAt: twoMinutesAgo,
          ),
          Item(
            id: '05',
            title: s.screenshot_item_6,
          ),
          Item(
            id: '06',
            title: s.screenshot_item_7,
          ),
          Item(
            id: '07',
            title: s.screenshot_item_8,
            doneAt: twoMinutesAgo,
          ),
        ],
      ),
      ShoppingList(
        id: '235c5b31-4dfe-407c-ba19-0c39de15c460',
        name: s.screenshot_list_2,
        createdAt: threeDaysAgo,
        items: const [
          Item(id: '11', title: ''),
          Item(id: '12', title: ''),
        ],
      ),
    ];
  }

  @override
  Future<void> saveLists(List<ShoppingList> lists) async {}

  @override
  Future<void> saveSelectedListId(String id) async {}
}
