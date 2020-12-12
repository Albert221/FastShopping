// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$_$_ItemFromJson(Map<String, dynamic> json) {
  return _$_Item(
    id: json['id'] as String,
    title: json['title'] as String,
    doneAt: json['doneAt'] == null
        ? null
        : DateTime.parse(json['doneAt'] as String),
    removed: json['removed'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'doneAt': instance.doneAt?.toIso8601String(),
      'removed': instance.removed,
    };
