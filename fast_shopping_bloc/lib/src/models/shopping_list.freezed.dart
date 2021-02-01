// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'shopping_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) {
  return _ShoppingList.fromJson(json);
}

/// @nodoc
class _$ShoppingListTearOff {
  const _$ShoppingListTearOff();

// ignore: unused_element
  _ShoppingList call(
      {@required String id,
      @required String name,
      @required DateTime createdAt,
      DateTime archivedAt,
      List<Item> items = const []}) {
    return _ShoppingList(
      id: id,
      name: name,
      createdAt: createdAt,
      archivedAt: archivedAt,
      items: items,
    );
  }

// ignore: unused_element
  ShoppingList fromJson(Map<String, Object> json) {
    return ShoppingList.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ShoppingList = _$ShoppingListTearOff();

/// @nodoc
mixin _$ShoppingList {
  String get id;
  String get name;
  DateTime get createdAt;
  DateTime get archivedAt;
  List<Item> get items;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ShoppingListCopyWith<ShoppingList> get copyWith;
}

/// @nodoc
abstract class $ShoppingListCopyWith<$Res> {
  factory $ShoppingListCopyWith(
          ShoppingList value, $Res Function(ShoppingList) then) =
      _$ShoppingListCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      DateTime createdAt,
      DateTime archivedAt,
      List<Item> items});
}

/// @nodoc
class _$ShoppingListCopyWithImpl<$Res> implements $ShoppingListCopyWith<$Res> {
  _$ShoppingListCopyWithImpl(this._value, this._then);

  final ShoppingList _value;
  // ignore: unused_field
  final $Res Function(ShoppingList) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object createdAt = freezed,
    Object archivedAt = freezed,
    Object items = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      archivedAt:
          archivedAt == freezed ? _value.archivedAt : archivedAt as DateTime,
      items: items == freezed ? _value.items : items as List<Item>,
    ));
  }
}

/// @nodoc
abstract class _$ShoppingListCopyWith<$Res>
    implements $ShoppingListCopyWith<$Res> {
  factory _$ShoppingListCopyWith(
          _ShoppingList value, $Res Function(_ShoppingList) then) =
      __$ShoppingListCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      DateTime createdAt,
      DateTime archivedAt,
      List<Item> items});
}

/// @nodoc
class __$ShoppingListCopyWithImpl<$Res> extends _$ShoppingListCopyWithImpl<$Res>
    implements _$ShoppingListCopyWith<$Res> {
  __$ShoppingListCopyWithImpl(
      _ShoppingList _value, $Res Function(_ShoppingList) _then)
      : super(_value, (v) => _then(v as _ShoppingList));

  @override
  _ShoppingList get _value => super._value as _ShoppingList;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object createdAt = freezed,
    Object archivedAt = freezed,
    Object items = freezed,
  }) {
    return _then(_ShoppingList(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      archivedAt:
          archivedAt == freezed ? _value.archivedAt : archivedAt as DateTime,
      items: items == freezed ? _value.items : items as List<Item>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ShoppingList extends _ShoppingList {
  const _$_ShoppingList(
      {@required this.id,
      @required this.name,
      @required this.createdAt,
      this.archivedAt,
      this.items = const []})
      : assert(id != null),
        assert(name != null),
        assert(createdAt != null),
        assert(items != null),
        super._();

  factory _$_ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$_$_ShoppingListFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final DateTime archivedAt;
  @JsonKey(defaultValue: const [])
  @override
  final List<Item> items;

  @override
  String toString() {
    return 'ShoppingList(id: $id, name: $name, createdAt: $createdAt, archivedAt: $archivedAt, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShoppingList &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.archivedAt, archivedAt) ||
                const DeepCollectionEquality()
                    .equals(other.archivedAt, archivedAt)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(archivedAt) ^
      const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$ShoppingListCopyWith<_ShoppingList> get copyWith =>
      __$ShoppingListCopyWithImpl<_ShoppingList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ShoppingListToJson(this);
  }
}

abstract class _ShoppingList extends ShoppingList {
  const _ShoppingList._() : super._();
  const factory _ShoppingList(
      {@required String id,
      @required String name,
      @required DateTime createdAt,
      DateTime archivedAt,
      List<Item> items}) = _$_ShoppingList;

  factory _ShoppingList.fromJson(Map<String, dynamic> json) =
      _$_ShoppingList.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  DateTime get archivedAt;
  @override
  List<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$ShoppingListCopyWith<_ShoppingList> get copyWith;
}
