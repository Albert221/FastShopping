// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
class _$ItemTearOff {
  const _$ItemTearOff();

// ignore: unused_element
  _Item call(
      {@required String id,
      @required String title,
      DateTime doneAt,
      bool removed = false}) {
    return _Item(
      id: id,
      title: title,
      doneAt: doneAt,
      removed: removed,
    );
  }

// ignore: unused_element
  Item fromJson(Map<String, Object> json) {
    return Item.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Item = _$ItemTearOff();

/// @nodoc
mixin _$Item {
  String get id;
  String get title;
  DateTime get doneAt;
  bool get removed;

  Map<String, dynamic> toJson();
  $ItemCopyWith<Item> get copyWith;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call({String id, String title, DateTime doneAt, bool removed});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object doneAt = freezed,
    Object removed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      doneAt: doneAt == freezed ? _value.doneAt : doneAt as DateTime,
      removed: removed == freezed ? _value.removed : removed as bool,
    ));
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, DateTime doneAt, bool removed});
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object doneAt = freezed,
    Object removed = freezed,
  }) {
    return _then(_Item(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      doneAt: doneAt == freezed ? _value.doneAt : doneAt as DateTime,
      removed: removed == freezed ? _value.removed : removed as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Item extends _Item {
  const _$_Item(
      {@required this.id,
      @required this.title,
      this.doneAt,
      this.removed = false})
      : assert(id != null),
        assert(title != null),
        assert(removed != null),
        super._();

  factory _$_Item.fromJson(Map<String, dynamic> json) =>
      _$_$_ItemFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime doneAt;
  @JsonKey(defaultValue: false)
  @override
  final bool removed;

  @override
  String toString() {
    return 'Item(id: $id, title: $title, doneAt: $doneAt, removed: $removed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.doneAt, doneAt) ||
                const DeepCollectionEquality().equals(other.doneAt, doneAt)) &&
            (identical(other.removed, removed) ||
                const DeepCollectionEquality().equals(other.removed, removed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(doneAt) ^
      const DeepCollectionEquality().hash(removed);

  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ItemToJson(this);
  }
}

abstract class _Item extends Item {
  const _Item._() : super._();
  const factory _Item(
      {@required String id,
      @required String title,
      DateTime doneAt,
      bool removed}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get doneAt;
  @override
  bool get removed;
  @override
  _$ItemCopyWith<_Item> get copyWith;
}
