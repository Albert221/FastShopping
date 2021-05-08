// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShoppingList _$_$_ShoppingListFromJson(Map<String, dynamic> json) {
  return _$_ShoppingList(
    id: json['id'] as String,
    name: json['name'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    archivedAt: json['archivedAt'] == null
        ? null
        : DateTime.parse(json['archivedAt'] as String),
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_ShoppingListToJson(_$_ShoppingList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'archivedAt': instance.archivedAt?.toIso8601String(),
      'items': instance.items,
    };
