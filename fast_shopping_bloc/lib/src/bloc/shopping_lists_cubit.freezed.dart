// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'shopping_lists_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShoppingListsStateTearOff {
  const _$ShoppingListsStateTearOff();

  _ShoppingListsState call(
      {String? selectedId, List<ShoppingList> lists = const []}) {
    return _ShoppingListsState(
      selectedId: selectedId,
      lists: lists,
    );
  }
}

/// @nodoc
const $ShoppingListsState = _$ShoppingListsStateTearOff();

/// @nodoc
mixin _$ShoppingListsState {
  String? get selectedId => throw _privateConstructorUsedError;
  List<ShoppingList> get lists => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingListsStateCopyWith<ShoppingListsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListsStateCopyWith<$Res> {
  factory $ShoppingListsStateCopyWith(
          ShoppingListsState value, $Res Function(ShoppingListsState) then) =
      _$ShoppingListsStateCopyWithImpl<$Res>;
  $Res call({String? selectedId, List<ShoppingList> lists});
}

/// @nodoc
class _$ShoppingListsStateCopyWithImpl<$Res>
    implements $ShoppingListsStateCopyWith<$Res> {
  _$ShoppingListsStateCopyWithImpl(this._value, this._then);

  final ShoppingListsState _value;
  // ignore: unused_field
  final $Res Function(ShoppingListsState) _then;

  @override
  $Res call({
    Object? selectedId = freezed,
    Object? lists = freezed,
  }) {
    return _then(_value.copyWith(
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      lists: lists == freezed
          ? _value.lists
          : lists // ignore: cast_nullable_to_non_nullable
              as List<ShoppingList>,
    ));
  }
}

/// @nodoc
abstract class _$ShoppingListsStateCopyWith<$Res>
    implements $ShoppingListsStateCopyWith<$Res> {
  factory _$ShoppingListsStateCopyWith(
          _ShoppingListsState value, $Res Function(_ShoppingListsState) then) =
      __$ShoppingListsStateCopyWithImpl<$Res>;
  @override
  $Res call({String? selectedId, List<ShoppingList> lists});
}

/// @nodoc
class __$ShoppingListsStateCopyWithImpl<$Res>
    extends _$ShoppingListsStateCopyWithImpl<$Res>
    implements _$ShoppingListsStateCopyWith<$Res> {
  __$ShoppingListsStateCopyWithImpl(
      _ShoppingListsState _value, $Res Function(_ShoppingListsState) _then)
      : super(_value, (v) => _then(v as _ShoppingListsState));

  @override
  _ShoppingListsState get _value => super._value as _ShoppingListsState;

  @override
  $Res call({
    Object? selectedId = freezed,
    Object? lists = freezed,
  }) {
    return _then(_ShoppingListsState(
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      lists: lists == freezed
          ? _value.lists
          : lists // ignore: cast_nullable_to_non_nullable
              as List<ShoppingList>,
    ));
  }
}

/// @nodoc

class _$_ShoppingListsState extends _ShoppingListsState {
  _$_ShoppingListsState({this.selectedId, this.lists = const []}) : super._();

  @override
  final String? selectedId;
  @JsonKey(defaultValue: const [])
  @override
  final List<ShoppingList> lists;

  @override
  String toString() {
    return 'ShoppingListsState(selectedId: $selectedId, lists: $lists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShoppingListsState &&
            (identical(other.selectedId, selectedId) ||
                const DeepCollectionEquality()
                    .equals(other.selectedId, selectedId)) &&
            (identical(other.lists, lists) ||
                const DeepCollectionEquality().equals(other.lists, lists)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedId) ^
      const DeepCollectionEquality().hash(lists);

  @JsonKey(ignore: true)
  @override
  _$ShoppingListsStateCopyWith<_ShoppingListsState> get copyWith =>
      __$ShoppingListsStateCopyWithImpl<_ShoppingListsState>(this, _$identity);
}

abstract class _ShoppingListsState extends ShoppingListsState {
  factory _ShoppingListsState({String? selectedId, List<ShoppingList> lists}) =
      _$_ShoppingListsState;
  _ShoppingListsState._() : super._();

  @override
  String? get selectedId => throw _privateConstructorUsedError;
  @override
  List<ShoppingList> get lists => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShoppingListsStateCopyWith<_ShoppingListsState> get copyWith =>
      throw _privateConstructorUsedError;
}
