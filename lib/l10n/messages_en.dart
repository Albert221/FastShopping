// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appTitle" : MessageLookupByLibrary.simpleMessage("Fast shopping"),
    "deleteDialogCancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "deleteDialogConfirm" : MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteDialogDescriptionCompleted" : MessageLookupByLibrary.simpleMessage("Are you sure you want to delete completed items?"),
    "deleteDialogDescriptionOne" : MessageLookupByLibrary.simpleMessage("Are you sure you want to delete this item?"),
    "deleteDialogTitle" : MessageLookupByLibrary.simpleMessage("Deleting"),
    "deletedAllSnackbarText" : MessageLookupByLibrary.simpleMessage("You have deleted all completed purchases."),
    "deletedSnackbarText" : MessageLookupByLibrary.simpleMessage("You have deleted an item."),
    "navigationTitle" : MessageLookupByLibrary.simpleMessage("Shopping list"),
    "purchaseDialogAdd" : MessageLookupByLibrary.simpleMessage("Add"),
    "purchaseDialogInputNotEmpty" : MessageLookupByLibrary.simpleMessage("Item name cannot be blank"),
    "purchaseDialogInputPlaceholder" : MessageLookupByLibrary.simpleMessage("White sugar"),
    "purchaseDialogTitle" : MessageLookupByLibrary.simpleMessage("Add item"),
    "purchasesPlaceholder" : MessageLookupByLibrary.simpleMessage("You have no items on your list."),
    "undo" : MessageLookupByLibrary.simpleMessage("Undo")
  };
}
