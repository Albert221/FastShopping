// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static m0(when) => "fait ${when}";

  static m1(when) => "Archivée ${when}";

  static m2(when) => "Créée ${when}";

  static m3(count) => "${Intl.plural(count, one: '1 article', other: '${count} articles')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add_item_dialog_add" : MessageLookupByLibrary.simpleMessage("AJOUTER"),
    "add_item_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ANNULER"),
    "add_item_dialog_title" : MessageLookupByLibrary.simpleMessage("Ajouter un article"),
    "add_list_dialog_add" : MessageLookupByLibrary.simpleMessage("AJOUTER"),
    "add_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ANNULER"),
    "add_list_dialog_name_hint" : MessageLookupByLibrary.simpleMessage("Inscrivez le nom de la liste de courses ici…"),
    "add_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Ajouter une nouvelle liste de courses"),
    "app_title" : MessageLookupByLibrary.simpleMessage("Fast Shopping"),
    "archive_banner_archive" : MessageLookupByLibrary.simpleMessage("ARCHIVES"),
    "archive_banner_content" : MessageLookupByLibrary.simpleMessage("Tout semble être coché. Souhaitez-vous archiver votre liste de courses ?"),
    "delete_shopping_list_dialog_body_after" : MessageLookupByLibrary.simpleMessage("la liste de courses ? Cette opération est irréversible."),
    "delete_shopping_list_dialog_body_before" : MessageLookupByLibrary.simpleMessage("Êtes-vous sûr de vouloir supprimer"),
    "delete_shopping_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ANNULER"),
    "delete_shopping_list_dialog_delete" : MessageLookupByLibrary.simpleMessage("SUPPRIMER"),
    "delete_shopping_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Suppression de la liste de courses"),
    "empty_list_add_some_items_message" : MessageLookupByLibrary.simpleMessage("Ajoutez des articles à votre liste !"),
    "item_removed_snackbar_message" : MessageLookupByLibrary.simpleMessage("Cet article a été retiré de la liste."),
    "item_removed_snackbar_undo" : MessageLookupByLibrary.simpleMessage("DÉFAIRE"),
    "layout_dialog_content" : MessageLookupByLibrary.simpleMessage("Vous pourrez modifier cela ultérieurement."),
    "layout_dialog_multiple_lists_title" : MessageLookupByLibrary.simpleMessage("Listes multiples"),
    "layout_dialog_one_list_title" : MessageLookupByLibrary.simpleMessage("Liste simple"),
    "layout_dialog_title" : MessageLookupByLibrary.simpleMessage("Disposition"),
    "list_archived_snackbar_message" : MessageLookupByLibrary.simpleMessage("La liste a été archivée avec succès."),
    "list_archived_snackbar_undo" : MessageLookupByLibrary.simpleMessage("DÉFAIRE"),
    "list_from_old_version" : MessageLookupByLibrary.simpleMessage("Liste de l\'ancienne version"),
    "list_item_done_ago" : m0,
    "list_item_edit" : MessageLookupByLibrary.simpleMessage("ÉDITER"),
    "list_item_editing_cancel" : MessageLookupByLibrary.simpleMessage("ANNULER"),
    "list_item_editing_save" : MessageLookupByLibrary.simpleMessage("SAUVEGARDER"),
    "list_item_no_name" : MessageLookupByLibrary.simpleMessage("Sans nom"),
    "list_item_remove" : MessageLookupByLibrary.simpleMessage("SUPPRIMER"),
    "list_item_title_hint" : MessageLookupByLibrary.simpleMessage("Écrivez le nom de l\'article ici…"),
    "menu_layout" : MessageLookupByLibrary.simpleMessage("Disposition"),
    "menu_licenses" : MessageLookupByLibrary.simpleMessage("Licences"),
    "menu_support_author" : MessageLookupByLibrary.simpleMessage("Soutenir l\'auteur"),
    "no_archived_lists_message" : MessageLookupByLibrary.simpleMessage("Il n\'y a pas de liste archivée."),
    "no_current_lists_message" : MessageLookupByLibrary.simpleMessage("Il n\'y a pas de liste en cours, créez-en une !"),
    "rename_shopping_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ANNULER"),
    "rename_shopping_list_dialog_name_hint" : MessageLookupByLibrary.simpleMessage("Inscrivez le nom de la nouvelle liste de courses ici…"),
    "rename_shopping_list_dialog_rename" : MessageLookupByLibrary.simpleMessage("RENOMMER"),
    "rename_shopping_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Renommer la liste de courses"),
    "screenshot_item_1" : MessageLookupByLibrary.simpleMessage("Sauce tomate"),
    "screenshot_item_2" : MessageLookupByLibrary.simpleMessage("Moutarde"),
    "screenshot_item_3" : MessageLookupByLibrary.simpleMessage("Sauce barbecue"),
    "screenshot_item_4" : MessageLookupByLibrary.simpleMessage("Vinaigre de vin rouge"),
    "screenshot_item_5" : MessageLookupByLibrary.simpleMessage("Sauce tomate épicée"),
    "screenshot_item_6" : MessageLookupByLibrary.simpleMessage("Huile d\'\'olive extra vierge"),
    "screenshot_item_7" : MessageLookupByLibrary.simpleMessage("Câpres et olives en bocal"),
    "screenshot_item_8" : MessageLookupByLibrary.simpleMessage("Sauce au piment fort"),
    "screenshot_list_1" : MessageLookupByLibrary.simpleMessage("Épicerie"),
    "screenshot_list_2" : MessageLookupByLibrary.simpleMessage("Soirée chez Mikaël"),
    "shopping_list_archived_snackbar_message" : MessageLookupByLibrary.simpleMessage("La liste a été archivée avec succès."),
    "shopping_list_no_name" : MessageLookupByLibrary.simpleMessage("Sans nom"),
    "shopping_list_not_selected_message" : MessageLookupByLibrary.simpleMessage("Aucune liste sélectionnée, créez-en une."),
    "shopping_list_not_selected_placeholder" : MessageLookupByLibrary.simpleMessage("Aucune liste sélectionnée"),
    "shopping_list_unarchived_snackbar_message" : MessageLookupByLibrary.simpleMessage("La liste a été désarchivée avec succès."),
    "shopping_lists_add_new" : MessageLookupByLibrary.simpleMessage("Nouvelle liste"),
    "shopping_lists_item_archived_at" : m1,
    "shopping_lists_item_created_at" : m2,
    "shopping_lists_item_elements" : m3,
    "shopping_lists_tab_archived" : MessageLookupByLibrary.simpleMessage("Archivées"),
    "shopping_lists_tab_current" : MessageLookupByLibrary.simpleMessage("En cours"),
    "shopping_lists_title" : MessageLookupByLibrary.simpleMessage("Listes de courses"),
    "support_author_dialog_body" : MessageLookupByLibrary.simpleMessage("Vous pouvez me soutenir, moi, le développeur de cette application, en allant à la page ci-dessous."),
    "support_author_dialog_button" : MessageLookupByLibrary.simpleMessage("SOUTENEZ-MOI"),
    "support_author_dialog_title" : MessageLookupByLibrary.simpleMessage("Soutenir l\'auteur")
  };
}
