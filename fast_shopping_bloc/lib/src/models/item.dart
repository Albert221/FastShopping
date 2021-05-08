import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String title,
    DateTime? doneAt,
    @Default(false) bool removed,
  }) = _Item;

  const Item._();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  bool get done => doneAt != null;
}
