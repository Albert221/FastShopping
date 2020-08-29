// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(when) => "done ${when}";

  static m1(when) => "Archived ${when}";

  static m2(when) => "Created ${when}";

  static m3(count) => "${Intl.plural(count, one: '1 element', other: '${count} elements')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add_item_dialog_add" : MessageLookupByLibrary.simpleMessage("ADD"),
    "add_item_dialog_cancel" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "add_item_dialog_title" : MessageLookupByLibrary.simpleMessage("Add item"),
    "add_list_dialog_add" : MessageLookupByLibrary.simpleMessage("ADD"),
    "add_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "add_list_dialog_name_hint" : MessageLookupByLibrary.simpleMessage("Write shopping list name here..."),
    "add_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Add new shopping list"),
    "app_title" : MessageLookupByLibrary.simpleMessage("Fast Shopping"),
    "archive_banner_archive" : MessageLookupByLibrary.simpleMessage("ARCHIVE"),
    "archive_banner_content" : MessageLookupByLibrary.simpleMessage("Looks like everything is marked as done. Do you wish to archive your shopping list?"),
    "delete_shopping_list_dialog_body_after" : MessageLookupByLibrary.simpleMessage(" shopping list? This operation cannot be undone."),
    "delete_shopping_list_dialog_body_before" : MessageLookupByLibrary.simpleMessage("Do you really want to delete "),
    "delete_shopping_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "delete_shopping_list_dialog_delete" : MessageLookupByLibrary.simpleMessage("DELETE"),
    "delete_shopping_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Deleting shopping list"),
    "donate_dialog_body" : MessageLookupByLibrary.simpleMessage("You can support application\'s author by sending him a donation."),
    "donate_dialog_paypal" : MessageLookupByLibrary.simpleMessage("GO TO PAYPAL.ME"),
    "donate_dialog_title" : MessageLookupByLibrary.simpleMessage("Donate"),
    "empty_list_add_some_items_message" : MessageLookupByLibrary.simpleMessage("Add some items to your list!"),
    "item_removed_snackbar_message" : MessageLookupByLibrary.simpleMessage("Item has been removed from the list."),
    "item_removed_snackbar_undo" : MessageLookupByLibrary.simpleMessage("UNDO"),
    "layout_dialog_content" : MessageLookupByLibrary.simpleMessage("You can change that later."),
    "layout_dialog_multiple_lists_title" : MessageLookupByLibrary.simpleMessage("Multiple lists"),
    "layout_dialog_one_list_title" : MessageLookupByLibrary.simpleMessage("One list"),
    "layout_dialog_title" : MessageLookupByLibrary.simpleMessage("Layout"),
    "list_archived_snackbar_message" : MessageLookupByLibrary.simpleMessage("List has been archived successfully."),
    "list_archived_snackbar_undo" : MessageLookupByLibrary.simpleMessage("UNDO"),
    "list_from_old_version" : MessageLookupByLibrary.simpleMessage("List from old version"),
    "list_item_done_ago" : m0,
    "list_item_edit" : MessageLookupByLibrary.simpleMessage("EDIT"),
    "list_item_editing_cancel" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "list_item_editing_save" : MessageLookupByLibrary.simpleMessage("SAVE"),
    "list_item_no_name" : MessageLookupByLibrary.simpleMessage("No name"),
    "list_item_remove" : MessageLookupByLibrary.simpleMessage("REMOVE"),
    "list_item_title_hint" : MessageLookupByLibrary.simpleMessage("Write item name here..."),
    "menu_donate" : MessageLookupByLibrary.simpleMessage("Donate"),
    "menu_layout" : MessageLookupByLibrary.simpleMessage("Layout"),
    "menu_licenses" : MessageLookupByLibrary.simpleMessage("Licenses"),
    "no_archived_lists_message" : MessageLookupByLibrary.simpleMessage("There are no archived lists."),
    "no_current_lists_message" : MessageLookupByLibrary.simpleMessage("There are no current lists, create one!"),
    "rename_shopping_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "rename_shopping_list_dialog_name_hint" : MessageLookupByLibrary.simpleMessage("Write new shopping list name here..."),
    "rename_shopping_list_dialog_rename" : MessageLookupByLibrary.simpleMessage("RENAME"),
    "rename_shopping_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Rename shopping list"),
    "shopping_list_archived_snackbar_message" : MessageLookupByLibrary.simpleMessage("List has been archived successfully."),
    "shopping_list_no_name" : MessageLookupByLibrary.simpleMessage("No name"),
    "shopping_list_not_selected_message" : MessageLookupByLibrary.simpleMessage("No list is selected, create one."),
    "shopping_list_not_selected_placeholder" : MessageLookupByLibrary.simpleMessage("No list selected"),
    "shopping_list_unarchived_snackbar_message" : MessageLookupByLibrary.simpleMessage("List has been unarchived successfully."),
    "shopping_lists_add_new" : MessageLookupByLibrary.simpleMessage("NEW LIST"),
    "shopping_lists_item_archived_at" : m1,
    "shopping_lists_item_created_at" : m2,
    "shopping_lists_item_elements" : m3,
    "shopping_lists_tab_archived" : MessageLookupByLibrary.simpleMessage("Archived"),
    "shopping_lists_tab_current" : MessageLookupByLibrary.simpleMessage("Current"),
    "shopping_lists_title" : MessageLookupByLibrary.simpleMessage("Shopping lists")
  };
}
