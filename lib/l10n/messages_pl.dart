// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pl';

  static m0(when) => "oznaczono ${when}";

  static m1(when) => "Zarchiwiz. ${when}";

  static m2(when) => "Stworzono ${when}";

  static m3(count) => "${Intl.plural(count, one: '1 element', few: '${count} elementy', many: '${count} elementów', other: '${count} elementu')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add_item_dialog_add" : MessageLookupByLibrary.simpleMessage("DODAJ"),
    "add_item_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ANULUJ"),
    "add_item_dialog_title" : MessageLookupByLibrary.simpleMessage("Dodaj element"),
    "add_list_dialog_add" : MessageLookupByLibrary.simpleMessage("DODAJ"),
    "add_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ANULUJ"),
    "add_list_dialog_name_hint" : MessageLookupByLibrary.simpleMessage("Wpisz tutaj nazwę listy..."),
    "add_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Dodaj nową listę zakupów"),
    "app_title" : MessageLookupByLibrary.simpleMessage("Szybkie Zakupy"),
    "archive_banner_archive" : MessageLookupByLibrary.simpleMessage("ARCHIWIZUJ"),
    "archive_banner_content" : MessageLookupByLibrary.simpleMessage("Wygląda na to, że wszystko jest już kupione. Czy chcesz zarchiwizować listę zakupów?"),
    "delete_shopping_list_dialog_body_after" : MessageLookupByLibrary.simpleMessage("? Ta operacja nie może zostać cofnięta."),
    "delete_shopping_list_dialog_body_before" : MessageLookupByLibrary.simpleMessage("Czy na pewno chcesz usunąć listę zakupów "),
    "delete_shopping_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ANULUJ"),
    "delete_shopping_list_dialog_delete" : MessageLookupByLibrary.simpleMessage("USUŃ"),
    "delete_shopping_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Usuwanie listy zakupów"),
    "donate_dialog_body" : MessageLookupByLibrary.simpleMessage("Możesz wesprzeć autora tej aplikacji wysyłając mu datek."),
    "donate_dialog_paypal" : MessageLookupByLibrary.simpleMessage("PRZEJDŹ DO PAYPAL.ME"),
    "donate_dialog_title" : MessageLookupByLibrary.simpleMessage("Podaruj datek"),
    "empty_list_add_some_items_message" : MessageLookupByLibrary.simpleMessage("Dodaj jakieś elementy do listy!"),
    "item_removed_snackbar_message" : MessageLookupByLibrary.simpleMessage("Element został usuniety z listy."),
    "item_removed_snackbar_undo" : MessageLookupByLibrary.simpleMessage("COFNIJ"),
    "layout_dialog_content" : MessageLookupByLibrary.simpleMessage("Będziesz mógł to później zmienić."),
    "layout_dialog_multiple_lists_title" : MessageLookupByLibrary.simpleMessage("Wiele list"),
    "layout_dialog_one_list_title" : MessageLookupByLibrary.simpleMessage("Jedna lista"),
    "layout_dialog_title" : MessageLookupByLibrary.simpleMessage("Układ"),
    "list_archived_snackbar_message" : MessageLookupByLibrary.simpleMessage("Lista została zarchiwizowana pomyślnie."),
    "list_archived_snackbar_undo" : MessageLookupByLibrary.simpleMessage("COFNIJ"),
    "list_from_old_version" : MessageLookupByLibrary.simpleMessage("Lista ze starej wersj"),
    "list_item_done_ago" : m0,
    "list_item_edit" : MessageLookupByLibrary.simpleMessage("EDYTUJ"),
    "list_item_editing_cancel" : MessageLookupByLibrary.simpleMessage("ANULUJ"),
    "list_item_editing_save" : MessageLookupByLibrary.simpleMessage("ZAPISZ"),
    "list_item_no_name" : MessageLookupByLibrary.simpleMessage("Bez nazwy"),
    "list_item_remove" : MessageLookupByLibrary.simpleMessage("USUŃ"),
    "list_item_title_hint" : MessageLookupByLibrary.simpleMessage("Wpisz tutaj nazwę..."),
    "menu_donate" : MessageLookupByLibrary.simpleMessage("Podaruj datek"),
    "menu_layout" : MessageLookupByLibrary.simpleMessage("Układ"),
    "menu_licenses" : MessageLookupByLibrary.simpleMessage("Licencje"),
    "no_archived_lists_message" : MessageLookupByLibrary.simpleMessage("Nie ma żadnych zarchiwizowanych list."),
    "no_current_lists_message" : MessageLookupByLibrary.simpleMessage("Nie ma żadnych bieżących list, stwórz jakieś!"),
    "rename_shopping_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ANULUJ"),
    "rename_shopping_list_dialog_name_hint" : MessageLookupByLibrary.simpleMessage("Wpisz tutaj nową nazwę..."),
    "rename_shopping_list_dialog_rename" : MessageLookupByLibrary.simpleMessage("ZMIEŃ NAZWĘ"),
    "rename_shopping_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Zmień nazwę listy"),
    "shopping_list_archived_snackbar_message" : MessageLookupByLibrary.simpleMessage("Lista została zarchiwizowana pomyślnie."),
    "shopping_list_no_name" : MessageLookupByLibrary.simpleMessage("Bez nazwy"),
    "shopping_list_not_selected_message" : MessageLookupByLibrary.simpleMessage("Żadna lista nie jest wybrana, stwórz ją."),
    "shopping_list_not_selected_placeholder" : MessageLookupByLibrary.simpleMessage("Nie wybrano listy"),
    "shopping_list_unarchived_snackbar_message" : MessageLookupByLibrary.simpleMessage("Lista została przywrócona pomyślnie."),
    "shopping_lists_add_new" : MessageLookupByLibrary.simpleMessage("NOWA LISTA"),
    "shopping_lists_item_archived_at" : m1,
    "shopping_lists_item_created_at" : m2,
    "shopping_lists_item_elements" : m3,
    "shopping_lists_tab_archived" : MessageLookupByLibrary.simpleMessage("Zarchiwizowane"),
    "shopping_lists_tab_current" : MessageLookupByLibrary.simpleMessage("Bieżące"),
    "shopping_lists_title" : MessageLookupByLibrary.simpleMessage("Listy zakupów")
  };
}
