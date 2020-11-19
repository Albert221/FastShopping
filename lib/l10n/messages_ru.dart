// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static m0(when) => "сделано ${when}";

  static m1(when) => "Заархивировано ${when}";

  static m2(when) => "Создано ${when}";

  static m3(count) => "${Intl.plural(count, one: '1 элемент', few: '${count} элемента', many: '${count} элементов', other: '${count} элементы')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add_item_dialog_add" : MessageLookupByLibrary.simpleMessage("ДОБАВИТЬ"),
    "add_item_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ОТМЕНИТЬ"),
    "add_item_dialog_title" : MessageLookupByLibrary.simpleMessage("Добавить пункт"),
    "add_list_dialog_add" : MessageLookupByLibrary.simpleMessage("ДОБАВИТЬ"),
    "add_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ОТМЕНИТЬ"),
    "add_list_dialog_name_hint" : MessageLookupByLibrary.simpleMessage("Введите здесь название списка покупок..."),
    "add_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Добавить новый список покупок"),
    "app_title" : MessageLookupByLibrary.simpleMessage("Быстрые покупки"),
    "archive_banner_archive" : MessageLookupByLibrary.simpleMessage("АРХИВИРОВАТЬ"),
    "archive_banner_content" : MessageLookupByLibrary.simpleMessage("Похоже, что всё отмечено как выполненное. Вы желаете заархивировать список покупок?"),
    "delete_shopping_list_dialog_body_after" : MessageLookupByLibrary.simpleMessage("список покупок? Эта операция не может быть отменена"),
    "delete_shopping_list_dialog_body_before" : MessageLookupByLibrary.simpleMessage("Вы действительно хотите удалить"),
    "delete_shopping_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ОТМЕНИТЬ"),
    "delete_shopping_list_dialog_delete" : MessageLookupByLibrary.simpleMessage("УДАЛИТЬ"),
    "delete_shopping_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Удалить список покупок"),
    "donate_dialog_body" : MessageLookupByLibrary.simpleMessage("Вы можете поддержать автора приложения, отправив ему пожертвование."),
    "donate_dialog_paypal" : MessageLookupByLibrary.simpleMessage("ПЕРЕЙТИ К PAYPAL.ME"),
    "donate_dialog_title" : MessageLookupByLibrary.simpleMessage("Пожертвовать"),
    "empty_list_add_some_items_message" : MessageLookupByLibrary.simpleMessage("Добавьте несколько пунктов в свой список!"),
    "item_removed_snackbar_message" : MessageLookupByLibrary.simpleMessage("Пункт был удалён из списка."),
    "item_removed_snackbar_undo" : MessageLookupByLibrary.simpleMessage("ОТМЕНИТЬ"),
    "layout_dialog_content" : MessageLookupByLibrary.simpleMessage("Вы можете изменить это позже."),
    "layout_dialog_multiple_lists_title" : MessageLookupByLibrary.simpleMessage("Несколько списков"),
    "layout_dialog_one_list_title" : MessageLookupByLibrary.simpleMessage("Один список"),
    "layout_dialog_title" : MessageLookupByLibrary.simpleMessage("Расположение"),
    "list_archived_snackbar_message" : MessageLookupByLibrary.simpleMessage("Список успешно заархивирован."),
    "list_archived_snackbar_undo" : MessageLookupByLibrary.simpleMessage("ОТМЕНИТЬ"),
    "list_from_old_version" : MessageLookupByLibrary.simpleMessage("Список из старой версии"),
    "list_item_done_ago" : m0,
    "list_item_edit" : MessageLookupByLibrary.simpleMessage("РЕДАКТИРОВАТЬ"),
    "list_item_editing_cancel" : MessageLookupByLibrary.simpleMessage("ОТМЕНИТЬ"),
    "list_item_editing_save" : MessageLookupByLibrary.simpleMessage("СОХРАНИТЬ"),
    "list_item_no_name" : MessageLookupByLibrary.simpleMessage("Безымянный"),
    "list_item_remove" : MessageLookupByLibrary.simpleMessage("УДАЛИТЬ"),
    "list_item_title_hint" : MessageLookupByLibrary.simpleMessage("Введите наименование пункта..."),
    "menu_donate" : MessageLookupByLibrary.simpleMessage("Пожертвовать"),
    "menu_layout" : MessageLookupByLibrary.simpleMessage("Расположение"),
    "menu_licenses" : MessageLookupByLibrary.simpleMessage("Лицензии"),
    "no_archived_lists_message" : MessageLookupByLibrary.simpleMessage("Нет архивированных списков."),
    "no_current_lists_message" : MessageLookupByLibrary.simpleMessage("Нет текущих списков, создайте их!"),
    "rename_shopping_list_dialog_cancel" : MessageLookupByLibrary.simpleMessage("ОТМЕНИТЬ"),
    "rename_shopping_list_dialog_name_hint" : MessageLookupByLibrary.simpleMessage("Введите здесь новое название списка покупок..."),
    "rename_shopping_list_dialog_rename" : MessageLookupByLibrary.simpleMessage("ПЕРЕИМЕНОВАТЬ"),
    "rename_shopping_list_dialog_title" : MessageLookupByLibrary.simpleMessage("Переименовать список покупок"),
    "screenshot_item_1" : MessageLookupByLibrary.simpleMessage("Томатный соус"),
    "screenshot_item_2" : MessageLookupByLibrary.simpleMessage("Горчица"),
    "screenshot_item_3" : MessageLookupByLibrary.simpleMessage("Соус для жареного мяса"),
    "screenshot_item_4" : MessageLookupByLibrary.simpleMessage("Красно-винный уксус"),
    "screenshot_item_5" : MessageLookupByLibrary.simpleMessage("Острый томатный соус"),
    "screenshot_item_6" : MessageLookupByLibrary.simpleMessage("Оливковое масло первого отжима"),
    "screenshot_item_7" : MessageLookupByLibrary.simpleMessage("Каперсы и оливки в банках"),
    "screenshot_item_8" : MessageLookupByLibrary.simpleMessage("Соус с острым перцем"),
    "screenshot_list_1" : MessageLookupByLibrary.simpleMessage("Продовольственные товары"),
    "screenshot_list_2" : MessageLookupByLibrary.simpleMessage("Вечеринка у Михаила"),
    "shopping_list_archived_snackbar_message" : MessageLookupByLibrary.simpleMessage("Список успешно заархивирован."),
    "shopping_list_no_name" : MessageLookupByLibrary.simpleMessage("Без имени"),
    "shopping_list_not_selected_message" : MessageLookupByLibrary.simpleMessage("Список не выбран, создайте его."),
    "shopping_list_not_selected_placeholder" : MessageLookupByLibrary.simpleMessage("Список не выбран"),
    "shopping_list_unarchived_snackbar_message" : MessageLookupByLibrary.simpleMessage("Список успешно разархивирован."),
    "shopping_lists_add_new" : MessageLookupByLibrary.simpleMessage("НОВЫЙ СПИСОК"),
    "shopping_lists_item_archived_at" : m1,
    "shopping_lists_item_created_at" : m2,
    "shopping_lists_item_elements" : m3,
    "shopping_lists_tab_archived" : MessageLookupByLibrary.simpleMessage("В архиве"),
    "shopping_lists_tab_current" : MessageLookupByLibrary.simpleMessage("Текущий"),
    "shopping_lists_title" : MessageLookupByLibrary.simpleMessage("Списки покупок")
  };
}
