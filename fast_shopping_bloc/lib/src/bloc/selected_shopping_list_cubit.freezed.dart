// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'selected_shopping_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ItemActionStateTearOff {
  const _$ItemActionStateTearOff();

  ItemActionNone none() {
    return const ItemActionNone();
  }

  ItemActionExpanded expanded(String itemId) {
    return ItemActionExpanded(
      itemId,
    );
  }

  ItemActionEditing editing(String itemId) {
    return ItemActionEditing(
      itemId,
    );
  }
}

/// @nodoc
const $ItemActionState = _$ItemActionStateTearOff();

/// @nodoc
mixin _$ItemActionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String itemId) expanded,
    required TResult Function(String itemId) editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String itemId)? expanded,
    TResult Function(String itemId)? editing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemActionNone value) none,
    required TResult Function(ItemActionExpanded value) expanded,
    required TResult Function(ItemActionEditing value) editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemActionNone value)? none,
    TResult Function(ItemActionExpanded value)? expanded,
    TResult Function(ItemActionEditing value)? editing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemActionStateCopyWith<$Res> {
  factory $ItemActionStateCopyWith(
          ItemActionState value, $Res Function(ItemActionState) then) =
      _$ItemActionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ItemActionStateCopyWithImpl<$Res>
    implements $ItemActionStateCopyWith<$Res> {
  _$ItemActionStateCopyWithImpl(this._value, this._then);

  final ItemActionState _value;
  // ignore: unused_field
  final $Res Function(ItemActionState) _then;
}

/// @nodoc
abstract class $ItemActionNoneCopyWith<$Res> {
  factory $ItemActionNoneCopyWith(
          ItemActionNone value, $Res Function(ItemActionNone) then) =
      _$ItemActionNoneCopyWithImpl<$Res>;
}

/// @nodoc
class _$ItemActionNoneCopyWithImpl<$Res>
    extends _$ItemActionStateCopyWithImpl<$Res>
    implements $ItemActionNoneCopyWith<$Res> {
  _$ItemActionNoneCopyWithImpl(
      ItemActionNone _value, $Res Function(ItemActionNone) _then)
      : super(_value, (v) => _then(v as ItemActionNone));

  @override
  ItemActionNone get _value => super._value as ItemActionNone;
}

/// @nodoc

class _$ItemActionNone extends ItemActionNone {
  const _$ItemActionNone() : super._();

  @override
  String toString() {
    return 'ItemActionState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ItemActionNone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String itemId) expanded,
    required TResult Function(String itemId) editing,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String itemId)? expanded,
    TResult Function(String itemId)? editing,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemActionNone value) none,
    required TResult Function(ItemActionExpanded value) expanded,
    required TResult Function(ItemActionEditing value) editing,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemActionNone value)? none,
    TResult Function(ItemActionExpanded value)? expanded,
    TResult Function(ItemActionEditing value)? editing,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class ItemActionNone extends ItemActionState {
  const factory ItemActionNone() = _$ItemActionNone;
  const ItemActionNone._() : super._();
}

/// @nodoc
abstract class $ItemActionExpandedCopyWith<$Res> {
  factory $ItemActionExpandedCopyWith(
          ItemActionExpanded value, $Res Function(ItemActionExpanded) then) =
      _$ItemActionExpandedCopyWithImpl<$Res>;
  $Res call({String itemId});
}

/// @nodoc
class _$ItemActionExpandedCopyWithImpl<$Res>
    extends _$ItemActionStateCopyWithImpl<$Res>
    implements $ItemActionExpandedCopyWith<$Res> {
  _$ItemActionExpandedCopyWithImpl(
      ItemActionExpanded _value, $Res Function(ItemActionExpanded) _then)
      : super(_value, (v) => _then(v as ItemActionExpanded));

  @override
  ItemActionExpanded get _value => super._value as ItemActionExpanded;

  @override
  $Res call({
    Object? itemId = freezed,
  }) {
    return _then(ItemActionExpanded(
      itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ItemActionExpanded extends ItemActionExpanded {
  const _$ItemActionExpanded(this.itemId) : super._();

  @override
  final String itemId;

  @override
  String toString() {
    return 'ItemActionState.expanded(itemId: $itemId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ItemActionExpanded &&
            (identical(other.itemId, itemId) ||
                const DeepCollectionEquality().equals(other.itemId, itemId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(itemId);

  @JsonKey(ignore: true)
  @override
  $ItemActionExpandedCopyWith<ItemActionExpanded> get copyWith =>
      _$ItemActionExpandedCopyWithImpl<ItemActionExpanded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String itemId) expanded,
    required TResult Function(String itemId) editing,
  }) {
    return expanded(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String itemId)? expanded,
    TResult Function(String itemId)? editing,
    required TResult orElse(),
  }) {
    if (expanded != null) {
      return expanded(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemActionNone value) none,
    required TResult Function(ItemActionExpanded value) expanded,
    required TResult Function(ItemActionEditing value) editing,
  }) {
    return expanded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemActionNone value)? none,
    TResult Function(ItemActionExpanded value)? expanded,
    TResult Function(ItemActionEditing value)? editing,
    required TResult orElse(),
  }) {
    if (expanded != null) {
      return expanded(this);
    }
    return orElse();
  }
}

abstract class ItemActionExpanded extends ItemActionState {
  const factory ItemActionExpanded(String itemId) = _$ItemActionExpanded;
  const ItemActionExpanded._() : super._();

  String get itemId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemActionExpandedCopyWith<ItemActionExpanded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemActionEditingCopyWith<$Res> {
  factory $ItemActionEditingCopyWith(
          ItemActionEditing value, $Res Function(ItemActionEditing) then) =
      _$ItemActionEditingCopyWithImpl<$Res>;
  $Res call({String itemId});
}

/// @nodoc
class _$ItemActionEditingCopyWithImpl<$Res>
    extends _$ItemActionStateCopyWithImpl<$Res>
    implements $ItemActionEditingCopyWith<$Res> {
  _$ItemActionEditingCopyWithImpl(
      ItemActionEditing _value, $Res Function(ItemActionEditing) _then)
      : super(_value, (v) => _then(v as ItemActionEditing));

  @override
  ItemActionEditing get _value => super._value as ItemActionEditing;

  @override
  $Res call({
    Object? itemId = freezed,
  }) {
    return _then(ItemActionEditing(
      itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ItemActionEditing extends ItemActionEditing {
  const _$ItemActionEditing(this.itemId) : super._();

  @override
  final String itemId;

  @override
  String toString() {
    return 'ItemActionState.editing(itemId: $itemId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ItemActionEditing &&
            (identical(other.itemId, itemId) ||
                const DeepCollectionEquality().equals(other.itemId, itemId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(itemId);

  @JsonKey(ignore: true)
  @override
  $ItemActionEditingCopyWith<ItemActionEditing> get copyWith =>
      _$ItemActionEditingCopyWithImpl<ItemActionEditing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String itemId) expanded,
    required TResult Function(String itemId) editing,
  }) {
    return editing(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String itemId)? expanded,
    TResult Function(String itemId)? editing,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemActionNone value) none,
    required TResult Function(ItemActionExpanded value) expanded,
    required TResult Function(ItemActionEditing value) editing,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemActionNone value)? none,
    TResult Function(ItemActionExpanded value)? expanded,
    TResult Function(ItemActionEditing value)? editing,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class ItemActionEditing extends ItemActionState {
  const factory ItemActionEditing(String itemId) = _$ItemActionEditing;
  const ItemActionEditing._() : super._();

  String get itemId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemActionEditingCopyWith<ItemActionEditing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SelectedShoppingListStateTearOff {
  const _$SelectedShoppingListStateTearOff();

  _SelectedShoppingListState call(ShoppingList? list,
      {ItemActionState itemActionState = const ItemActionState.none()}) {
    return _SelectedShoppingListState(
      list,
      itemActionState: itemActionState,
    );
  }
}

/// @nodoc
const $SelectedShoppingListState = _$SelectedShoppingListStateTearOff();

/// @nodoc
mixin _$SelectedShoppingListState {
  ShoppingList? get list => throw _privateConstructorUsedError;
  ItemActionState get itemActionState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedShoppingListStateCopyWith<SelectedShoppingListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedShoppingListStateCopyWith<$Res> {
  factory $SelectedShoppingListStateCopyWith(SelectedShoppingListState value,
          $Res Function(SelectedShoppingListState) then) =
      _$SelectedShoppingListStateCopyWithImpl<$Res>;
  $Res call({ShoppingList? list, ItemActionState itemActionState});

  $ShoppingListCopyWith<$Res>? get list;
  $ItemActionStateCopyWith<$Res> get itemActionState;
}

/// @nodoc
class _$SelectedShoppingListStateCopyWithImpl<$Res>
    implements $SelectedShoppingListStateCopyWith<$Res> {
  _$SelectedShoppingListStateCopyWithImpl(this._value, this._then);

  final SelectedShoppingListState _value;
  // ignore: unused_field
  final $Res Function(SelectedShoppingListState) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? itemActionState = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ShoppingList?,
      itemActionState: itemActionState == freezed
          ? _value.itemActionState
          : itemActionState // ignore: cast_nullable_to_non_nullable
              as ItemActionState,
    ));
  }

  @override
  $ShoppingListCopyWith<$Res>? get list {
    if (_value.list == null) {
      return null;
    }

    return $ShoppingListCopyWith<$Res>(_value.list!, (value) {
      return _then(_value.copyWith(list: value));
    });
  }

  @override
  $ItemActionStateCopyWith<$Res> get itemActionState {
    return $ItemActionStateCopyWith<$Res>(_value.itemActionState, (value) {
      return _then(_value.copyWith(itemActionState: value));
    });
  }
}

/// @nodoc
abstract class _$SelectedShoppingListStateCopyWith<$Res>
    implements $SelectedShoppingListStateCopyWith<$Res> {
  factory _$SelectedShoppingListStateCopyWith(_SelectedShoppingListState value,
          $Res Function(_SelectedShoppingListState) then) =
      __$SelectedShoppingListStateCopyWithImpl<$Res>;
  @override
  $Res call({ShoppingList? list, ItemActionState itemActionState});

  @override
  $ShoppingListCopyWith<$Res>? get list;
  @override
  $ItemActionStateCopyWith<$Res> get itemActionState;
}

/// @nodoc
class __$SelectedShoppingListStateCopyWithImpl<$Res>
    extends _$SelectedShoppingListStateCopyWithImpl<$Res>
    implements _$SelectedShoppingListStateCopyWith<$Res> {
  __$SelectedShoppingListStateCopyWithImpl(_SelectedShoppingListState _value,
      $Res Function(_SelectedShoppingListState) _then)
      : super(_value, (v) => _then(v as _SelectedShoppingListState));

  @override
  _SelectedShoppingListState get _value =>
      super._value as _SelectedShoppingListState;

  @override
  $Res call({
    Object? list = freezed,
    Object? itemActionState = freezed,
  }) {
    return _then(_SelectedShoppingListState(
      list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ShoppingList?,
      itemActionState: itemActionState == freezed
          ? _value.itemActionState
          : itemActionState // ignore: cast_nullable_to_non_nullable
              as ItemActionState,
    ));
  }
}

/// @nodoc

class _$_SelectedShoppingListState implements _SelectedShoppingListState {
  const _$_SelectedShoppingListState(this.list,
      {this.itemActionState = const ItemActionState.none()});

  @override
  final ShoppingList? list;
  @JsonKey(defaultValue: const ItemActionState.none())
  @override
  final ItemActionState itemActionState;

  @override
  String toString() {
    return 'SelectedShoppingListState(list: $list, itemActionState: $itemActionState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelectedShoppingListState &&
            (identical(other.list, list) ||
                const DeepCollectionEquality().equals(other.list, list)) &&
            (identical(other.itemActionState, itemActionState) ||
                const DeepCollectionEquality()
                    .equals(other.itemActionState, itemActionState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(list) ^
      const DeepCollectionEquality().hash(itemActionState);

  @JsonKey(ignore: true)
  @override
  _$SelectedShoppingListStateCopyWith<_SelectedShoppingListState>
      get copyWith =>
          __$SelectedShoppingListStateCopyWithImpl<_SelectedShoppingListState>(
              this, _$identity);
}

abstract class _SelectedShoppingListState implements SelectedShoppingListState {
  const factory _SelectedShoppingListState(ShoppingList? list,
      {ItemActionState itemActionState}) = _$_SelectedShoppingListState;

  @override
  ShoppingList? get list => throw _privateConstructorUsedError;
  @override
  ItemActionState get itemActionState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SelectedShoppingListStateCopyWith<_SelectedShoppingListState>
      get copyWith => throw _privateConstructorUsedError;
}
