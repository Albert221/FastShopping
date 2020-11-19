// File generated with arbify_flutter.
// DO NOT MODIFY BY HAND.
// ignore_for_file: lines_longer_than_80_chars, non_constant_identifier_names
// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class S {
  final String localeName;

  const S(this.localeName);

  static const delegate = ArbifyLocalizationsDelegate();

  static Future<S> load(Locale locale) {
    final localeName = Intl.canonicalizedLocale(locale.toString());

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  }

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  String get app_title => Intl.message(
        'Fast Shopping',
        name: 'app_title',        
        desc: 'Shown on top of the screen.',
      );

  String get menu_licenses => Intl.message(
        'Licenses',
        name: 'menu_licenses',
      );

  String get list_item_no_name => Intl.message(
        'No name',
        name: 'list_item_no_name',        
        desc: 'When the item has no/empty name.',
      );

  String list_item_done_ago(String when) => Intl.message(
        'done ${when}',
        name: 'list_item_done_ago',        
        desc: 'Small caps date when item was marked as done.',        
        args: [when],
      );

  String get list_item_editing_cancel => Intl.message(
        'CANCEL',
        name: 'list_item_editing_cancel',
      );

  String get list_item_editing_save => Intl.message(
        'SAVE',
        name: 'list_item_editing_save',
      );

  String get list_item_remove => Intl.message(
        'REMOVE',
        name: 'list_item_remove',
      );

  String get list_item_edit => Intl.message(
        'EDIT',
        name: 'list_item_edit',
      );

  String get item_removed_snackbar_message => Intl.message(
        'Item has been removed from the list.',
        name: 'item_removed_snackbar_message',
      );

  String get item_removed_snackbar_undo => Intl.message(
        'UNDO',
        name: 'item_removed_snackbar_undo',
      );

  String get add_item_dialog_title => Intl.message(
        'Add item',
        name: 'add_item_dialog_title',
      );

  String get add_item_dialog_cancel => Intl.message(
        'CANCEL',
        name: 'add_item_dialog_cancel',
      );

  String get add_item_dialog_add => Intl.message(
        'ADD',
        name: 'add_item_dialog_add',
      );

  String get archive_banner_content => Intl.message(
        'Looks like everything is marked as done. Do you wish to archive your shopping list?',
        name: 'archive_banner_content',
      );

  String get archive_banner_archive => Intl.message(
        'ARCHIVE',
        name: 'archive_banner_archive',
      );

  String get shopping_list_not_selected_placeholder => Intl.message(
        'No list selected',
        name: 'shopping_list_not_selected_placeholder',
      );

  String get shopping_list_not_selected_message => Intl.message(
        'No list is selected, create one.',
        name: 'shopping_list_not_selected_message',
      );

  String get empty_list_add_some_items_message => Intl.message(
        'Add some items to your list!',
        name: 'empty_list_add_some_items_message',
      );

  String get list_archived_snackbar_message => Intl.message(
        'List has been archived successfully.',
        name: 'list_archived_snackbar_message',
      );

  String get list_archived_snackbar_undo => Intl.message(
        'UNDO',
        name: 'list_archived_snackbar_undo',
      );

  String get shopping_lists_title => Intl.message(
        'Shopping lists',
        name: 'shopping_lists_title',
      );

  String get shopping_lists_tab_archived => Intl.message(
        'Archived',
        name: 'shopping_lists_tab_archived',
      );

  String get shopping_lists_add_new => Intl.message(
        'NEW LIST',
        name: 'shopping_lists_add_new',
      );

  String shopping_lists_item_created_at(String when) => Intl.message(
        'Created ${when}',
        name: 'shopping_lists_item_created_at',        
        args: [when],
      );

  String shopping_lists_item_archived_at(String when) => Intl.message(
        'Archived ${when}',
        name: 'shopping_lists_item_archived_at',        
        args: [when],
      );

  String get shopping_list_no_name => Intl.message(
        'No name',
        name: 'shopping_list_no_name',
      );

  String get shopping_list_archived_snackbar_message => Intl.message(
        'List has been archived successfully.',
        name: 'shopping_list_archived_snackbar_message',
      );

  String get shopping_list_unarchived_snackbar_message => Intl.message(
        'List has been unarchived successfully.',
        name: 'shopping_list_unarchived_snackbar_message',
      );

  String get add_list_dialog_title => Intl.message(
        'Add new shopping list',
        name: 'add_list_dialog_title',
      );

  String get add_list_dialog_name_hint => Intl.message(
        'Write shopping list name here...',
        name: 'add_list_dialog_name_hint',
      );

  String get add_list_dialog_cancel => Intl.message(
        'CANCEL',
        name: 'add_list_dialog_cancel',
      );

  String get add_list_dialog_add => Intl.message(
        'ADD',
        name: 'add_list_dialog_add',
      );

  String get rename_shopping_list_dialog_title => Intl.message(
        'Rename shopping list',
        name: 'rename_shopping_list_dialog_title',
      );

  String get rename_shopping_list_dialog_name_hint => Intl.message(
        'Write new shopping list name here...',
        name: 'rename_shopping_list_dialog_name_hint',
      );

  String get rename_shopping_list_dialog_cancel => Intl.message(
        'CANCEL',
        name: 'rename_shopping_list_dialog_cancel',
      );

  String get rename_shopping_list_dialog_rename => Intl.message(
        'RENAME',
        name: 'rename_shopping_list_dialog_rename',
      );

  String get delete_shopping_list_dialog_title => Intl.message(
        'Deleting shopping list',
        name: 'delete_shopping_list_dialog_title',
      );

  String get delete_shopping_list_dialog_cancel => Intl.message(
        'CANCEL',
        name: 'delete_shopping_list_dialog_cancel',
      );

  String get delete_shopping_list_dialog_delete => Intl.message(
        'DELETE',
        name: 'delete_shopping_list_dialog_delete',
      );

  String get no_current_lists_message => Intl.message(
        'There are no current lists, create one!',
        name: 'no_current_lists_message',
      );

  String get no_archived_lists_message => Intl.message(
        'There are no archived lists.',
        name: 'no_archived_lists_message',
      );

  String get list_from_old_version => Intl.message(
        'List from old version',
        name: 'list_from_old_version',
      );

  String shopping_lists_item_elements(num count) => Intl.message(
        '${Intl.plural(count, one: '1 element', other: '${count} elements', args: [count])}',
        name: 'shopping_lists_item_elements',        
        args: [count],
      );

  String get list_item_title_hint => Intl.message(
        'Write item name here...',
        name: 'list_item_title_hint',        
        desc: 'Placeholder in item name text field.',
      );

  String get shopping_lists_tab_current => Intl.message(
        'Current',
        name: 'shopping_lists_tab_current',
      );

  String get menu_layout => Intl.message(
        'Layout',
        name: 'menu_layout',        
        desc: 'Shown on the main screen dropdown, next to the view_stream material icon.',
      );

  String get layout_dialog_title => Intl.message(
        'Layout',
        name: 'layout_dialog_title',
      );

  String get layout_dialog_one_list_title => Intl.message(
        'One list',
        name: 'layout_dialog_one_list_title',
      );

  String get layout_dialog_multiple_lists_title => Intl.message(
        'Multiple lists',
        name: 'layout_dialog_multiple_lists_title',
      );

  String get layout_dialog_content => Intl.message(
        'You can change that later.',
        name: 'layout_dialog_content',        
        desc: 'Small text shown under one/multiple lists options.',
      );

  String get delete_shopping_list_dialog_body_before => Intl.message(
        'Do you really want to delete ',
        name: 'delete_shopping_list_dialog_body_before',
      );

  String get delete_shopping_list_dialog_body_after => Intl.message(
        ' shopping list? This operation cannot be undone.',
        name: 'delete_shopping_list_dialog_body_after',
      );

  String get screenshot_item_1 => Intl.message(
        'Tomato sauce',
        name: 'screenshot_item_1',        
        desc: 'Item visible on app stores screenshots.',
      );

  String get screenshot_item_2 => Intl.message(
        'Mustard',
        name: 'screenshot_item_2',
      );

  String get screenshot_item_3 => Intl.message(
        'Barbecue sauce',
        name: 'screenshot_item_3',
      );

  String get screenshot_item_4 => Intl.message(
        'Red-wine vinegar',
        name: 'screenshot_item_4',
      );

  String get screenshot_item_5 => Intl.message(
        'Salsa',
        name: 'screenshot_item_5',        
        desc: 'Expanded item on shopping list in app stores screenshots.',
      );

  String get screenshot_item_6 => Intl.message(
        'Extra virgin olive oil',
        name: 'screenshot_item_6',
      );

  String get screenshot_item_7 => Intl.message(
        'Jarred capers and olives',
        name: 'screenshot_item_7',
      );

  String get screenshot_item_8 => Intl.message(
        'Hot pepper sauce',
        name: 'screenshot_item_8',
      );

  String get screenshot_list_1 => Intl.message(
        'Groceries',
        name: 'screenshot_list_1',        
        desc: 'Active shopping list in app stores screenshots.',
      );

  String get screenshot_list_2 => Intl.message(
        'Party at Mike\'s',
        name: 'screenshot_list_2',        
        desc: 'Inactive shopping list in app stores screenshots.',
      );

  String get menu_support_author => Intl.message(
        'Support the author',
        name: 'menu_support_author',
      );

  String get support_author_dialog_button => Intl.message(
        'SUPPORT ME',
        name: 'support_author_dialog_button',
      );

  String get support_author_dialog_title => Intl.message(
        'Support the author',
        name: 'support_author_dialog_title',
      );

  String get support_author_dialog_body => Intl.message(
        'You can support me, the developer of this app, by going to the page below.',
        name: 'support_author_dialog_body',
      );
}

class ArbifyLocalizationsDelegate extends LocalizationsDelegate<S> {
  const ArbifyLocalizationsDelegate();

  List<Locale> get supportedLocales => [
        Locale.fromSubtags(languageCode: 'de'),
        Locale.fromSubtags(languageCode: 'en'),
        Locale.fromSubtags(languageCode: 'mk'),
        Locale.fromSubtags(languageCode: 'pl'),
        Locale.fromSubtags(languageCode: 'ru'),
  ];

  @override
  bool isSupported(Locale locale) => [
        'de',
        'en',
        'mk',
        'pl',
        'ru',
      ].contains(locale.languageCode);

  @override
  Future<S> load(Locale locale) => S.load(locale);

  @override
  bool shouldReload(ArbifyLocalizationsDelegate old) => false;
}
