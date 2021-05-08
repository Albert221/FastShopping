// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
class _$ItemTearOff {
  const _$ItemTearOff();

  _Item call(
      {required String id,
      required String title,
      DateTime? doneAt,
      bool removed = false}) {
    return _Item(
      id: id,
      title: title,
      doneAt: doneAt,
      removed: removed,
    );
  }

  Item fromJson(Map<String, Object> json) {
    return Item.fromJson(json);
  }
}

/// @nodoc
const $Item = _$ItemTearOff();

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get doneAt => throw _privateConstructorUsedError;
  bool get removed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call({String id, String title, DateTime? doneAt, bool removed});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? doneAt = freezed,
    Object? removed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      doneAt: doneAt == freezed
          ? _value.doneAt
          : doneAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      removed: removed == freezed
          ? _value.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, DateTime? doneAt, bool removed});
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
    Object? id = freezed,
    Object? title = freezed,
    Object? doneAt = freezed,
    Object? removed = freezed,
  }) {
    return _then(_Item(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      doneAt: doneAt == freezed
          ? _value.doneAt
          : doneAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      removed: removed == freezed
          ? _value.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item extends _Item {
  const _$_Item(
      {required this.id,
      required this.title,
      this.doneAt,
      this.removed = false})
      : super._();

  factory _$_Item.fromJson(Map<String, dynamic> json) =>
      _$_$_ItemFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime? doneAt;
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

  @JsonKey(ignore: true)
  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ItemToJson(this);
  }
}

abstract class _Item extends Item {
  const factory _Item(
      {required String id,
      required String title,
      DateTime? doneAt,
      bool removed}) = _$_Item;
  const _Item._() : super._();

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  DateTime? get doneAt => throw _privateConstructorUsedError;
  @override
  bool get removed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ItemCopyWith<_Item> get copyWith => throw _privateConstructorUsedError;
}
