// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static m0(when) => "fertig ${when}";

  static m1(when) => "Archiviert ${when}";

  static m2(when) => "Erstellt ${when}";

  static m3(count) => "${Intl.plural(count, one: '1 Element', other: '${count} Elemente')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add_item_dialog_add" : MessageLookupByLibrary.simpleMessage("HINZUFÜGEN"),
    "add_item_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ABBRECHEN"),
    "add_item_dialog_title" : MessageLookupByLibrary.simpleMessage("Artikel hinzufügen"),
    "add_list_dialog_add" : MessageLookupByLibrary.simpleMessage("HINZUFÜGEN"),
    "add_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ABBRECHEN"),
    "add_list_dialog_name_hint" : MessageLookupByLibrary.simpleMessage("Schreibe hier den Namen der Einkaufsliste..."),
    "add_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Neue Einkaufsliste hinzufügen"),
    "app_title" : MessageLookupByLibrary.simpleMessage("Fast Shopping"),
    "archive_banner_archive" : MessageLookupByLibrary.simpleMessage("ARCHIVIEREN"),
    "archive_banner_content" : MessageLookupByLibrary.simpleMessage("Sieht aus, als sei alles als erledigt gekennzeichnet. Einkaufsliste archivieren?"),
    "delete_shopping_list_dialog_body_after" : MessageLookupByLibrary.simpleMessage(" wirklich gelöscht werden? Diese Aktion kann nicht rückgängig gemacht werden"),
    "delete_shopping_list_dialog_body_before" : MessageLookupByLibrary.simpleMessage("Soll "),
    "delete_shopping_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ABBRECHEN"),
    "delete_shopping_list_dialog_delete" : MessageLookupByLibrary.simpleMessage("LÖSCHEN"),
    "delete_shopping_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Einkaufsliste löschen"),
    "empty_list_add_some_items_message" : MessageLookupByLibrary.simpleMessage("Füge Artikel der Liste hinzu!"),
    "item_removed_snackbar_message" : MessageLookupByLibrary.simpleMessage("Artikel wurde von der Liste entfernt."),
    "item_removed_snackbar_undo" : MessageLookupByLibrary.simpleMessage("RÜCKGÄNGIG"),
    "layout_dialog_content" : MessageLookupByLibrary.simpleMessage("Du kannst dies später noch ändern."),
    "layout_dialog_multiple_lists_title" : MessageLookupByLibrary.simpleMessage("Mehrere Listen"),
    "layout_dialog_one_list_title" : MessageLookupByLibrary.simpleMessage("Eine Liste"),
    "layout_dialog_title" : MessageLookupByLibrary.simpleMessage("Layout"),
    "list_archived_snackbar_message" : MessageLookupByLibrary.simpleMessage("Die Liste wurde erfolgreich archiviert."),
    "list_archived_snackbar_undo" : MessageLookupByLibrary.simpleMessage("RÜCKGÄNGIG"),
    "list_from_old_version" : MessageLookupByLibrary.simpleMessage("Liste von alter Version"),
    "list_item_done_ago" : m0,
    "list_item_edit" : MessageLookupByLibrary.simpleMessage("BEARBEITEN"),
    "list_item_editing_cancel" : MessageLookupByLibrary.simpleMessage("ABBRECHEN"),
    "list_item_editing_save" : MessageLookupByLibrary.simpleMessage("SPEICHERN"),
    "list_item_no_name" : MessageLookupByLibrary.simpleMessage("kein Inhalt"),
    "list_item_remove" : MessageLookupByLibrary.simpleMessage("ENTFERNEN"),
    "list_item_title_hint" : MessageLookupByLibrary.simpleMessage("Schreibe hier den Namen des Artikels..."),
    "menu_layout" : MessageLookupByLibrary.simpleMessage("Layout"),
    "menu_licenses" : MessageLookupByLibrary.simpleMessage("Lizenzen"),
    "menu_support_author" : MessageLookupByLibrary.simpleMessage("Unterstützen Sie den Autor"),
    "no_archived_lists_message" : MessageLookupByLibrary.simpleMessage("Keine archivierten Listen."),
    "no_current_lists_message" : MessageLookupByLibrary.simpleMessage("Keine Listen vorhanden, erstelle eine!"),
    "rename_shopping_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ABBRECHEN"),
    "rename_shopping_list_dialog_name_hint" : MessageLookupByLibrary.simpleMessage("Schreibe hier den neuen Namen der Einkaufsliste..."),
    "rename_shopping_list_dialog_rename" : MessageLookupByLibrary.simpleMessage("UMBENENNEN"),
    "rename_shopping_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Einkaufsliste umbenennen"),
    "screenshot_item_1" : MessageLookupByLibrary.simpleMessage("Markenbutter"),
    "screenshot_item_2" : MessageLookupByLibrary.simpleMessage("Käse"),
    "screenshot_item_3" : MessageLookupByLibrary.simpleMessage("Kopfsalat"),
    "screenshot_item_4" : MessageLookupByLibrary.simpleMessage("Naturreis"),
    "screenshot_item_5" : MessageLookupByLibrary.simpleMessage("Tiefgefrorene Gemüsepfanne"),
    "screenshot_item_6" : MessageLookupByLibrary.simpleMessage("Buchweizen"),
    "screenshot_item_7" : MessageLookupByLibrary.simpleMessage("Rote Beete"),
    "screenshot_item_8" : MessageLookupByLibrary.simpleMessage("Körniger Frischkäse"),
    "screenshot_list_1" : MessageLookupByLibrary.simpleMessage("Wocheneinkauf"),
    "screenshot_list_2" : MessageLookupByLibrary.simpleMessage("Hausparty bei Christina"),
    "shopping_list_archived_snackbar_message" : MessageLookupByLibrary.simpleMessage("Die"),
    "shopping_list_no_name" : MessageLookupByLibrary.simpleMessage("Kein Name"),
    "shopping_list_not_selected_message" : MessageLookupByLibrary.simpleMessage("Es ist keine Liste ausgewählt, erstelle eine."),
    "shopping_list_not_selected_placeholder" : MessageLookupByLibrary.simpleMessage("Keine Liste ausgewählt"),
    "shopping_list_unarchived_snackbar_message" : MessageLookupByLibrary.simpleMessage("Die Liste wurde erfolgreich wiederher."),
    "shopping_lists_add_new" : MessageLookupByLibrary.simpleMessage("NEUE LISTE"),
    "shopping_lists_item_archived_at" : m1,
    "shopping_lists_item_created_at" : m2,
    "shopping_lists_item_elements" : m3,
    "shopping_lists_tab_archived" : MessageLookupByLibrary.simpleMessage("Archiviert"),
    "shopping_lists_tab_current" : MessageLookupByLibrary.simpleMessage("Aktuell"),
    "shopping_lists_title" : MessageLookupByLibrary.simpleMessage("Einkaufslisten"),
    "support_author_dialog_body" : MessageLookupByLibrary.simpleMessage("Sie können mich, den Entwickler dieser App, auf der folgenden Seite unterstützen."),
    "support_author_dialog_button" : MessageLookupByLibrary.simpleMessage("UNTERSTÜTZE MICH"),
    "support_author_dialog_title" : MessageLookupByLibrary.simpleMessage("Unterstützen Sie den Autor")
  };
}
