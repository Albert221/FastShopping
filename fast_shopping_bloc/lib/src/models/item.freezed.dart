// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ItemTearOff {
  const _$ItemTearOff();

// ignore: unused_element
  _Item call({@required String id, @required String title, DateTime doneAt}) {
    return _Item(
      id: id,
      title: title,
      doneAt: doneAt,
    );
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

  $ItemCopyWith<Item> get copyWith;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call({String id, String title, DateTime doneAt});
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
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      doneAt: doneAt == freezed ? _value.doneAt : doneAt as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, DateTime doneAt});
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
  }) {
    return _then(_Item(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      doneAt: doneAt == freezed ? _value.doneAt : doneAt as DateTime,
    ));
  }
}

/// @nodoc
class _$_Item implements _Item {
  const _$_Item({@required this.id, @required this.title, this.doneAt})
      : assert(id != null),
        assert(title != null);

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime doneAt;

  @override
  String toString() {
    return 'Item(id: $id, title: $title, doneAt: $doneAt)';
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
                const DeepCollectionEquality().equals(other.doneAt, doneAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(doneAt);

  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);
}

abstract class _Item implements Item {
  const factory _Item(
      {@required String id, @required String title, DateTime doneAt}) = _$_Item;

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get doneAt;
  @override
  _$ItemCopyWith<_Item> get copyWith;
}
