// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'selected_shopping_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ItemActionStateTearOff {
  const _$ItemActionStateTearOff();

// ignore: unused_element
  ItemActionNone none() {
    return const ItemActionNone();
  }

// ignore: unused_element
  ItemActionExpanded expanded(String itemId) {
    return ItemActionExpanded(
      itemId,
    );
  }

// ignore: unused_element
  ItemActionEditing editing(String itemId) {
    return ItemActionEditing(
      itemId,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ItemActionState = _$ItemActionStateTearOff();

/// @nodoc
mixin _$ItemActionState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult none(),
    @required TResult expanded(String itemId),
    @required TResult editing(String itemId),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult none(),
    TResult expanded(String itemId),
    TResult editing(String itemId),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult none(ItemActionNone value),
    @required TResult expanded(ItemActionExpanded value),
    @required TResult editing(ItemActionEditing value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult none(ItemActionNone value),
    TResult expanded(ItemActionExpanded value),
    TResult editing(ItemActionEditing value),
    @required TResult orElse(),
  });
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
  TResult when<TResult extends Object>({
    @required TResult none(),
    @required TResult expanded(String itemId),
    @required TResult editing(String itemId),
  }) {
    assert(none != null);
    assert(expanded != null);
    assert(editing != null);
    return none();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult none(),
    TResult expanded(String itemId),
    TResult editing(String itemId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult none(ItemActionNone value),
    @required TResult expanded(ItemActionExpanded value),
    @required TResult editing(ItemActionEditing value),
  }) {
    assert(none != null);
    assert(expanded != null);
    assert(editing != null);
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult none(ItemActionNone value),
    TResult expanded(ItemActionExpanded value),
    TResult editing(ItemActionEditing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class ItemActionNone extends ItemActionState {
  const ItemActionNone._() : super._();
  const factory ItemActionNone() = _$ItemActionNone;
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
    Object itemId = freezed,
  }) {
    return _then(ItemActionExpanded(
      itemId == freezed ? _value.itemId : itemId as String,
    ));
  }
}

/// @nodoc
class _$ItemActionExpanded extends ItemActionExpanded {
  const _$ItemActionExpanded(this.itemId)
      : assert(itemId != null),
        super._();

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
  TResult when<TResult extends Object>({
    @required TResult none(),
    @required TResult expanded(String itemId),
    @required TResult editing(String itemId),
  }) {
    assert(none != null);
    assert(expanded != null);
    assert(editing != null);
    return expanded(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult none(),
    TResult expanded(String itemId),
    TResult editing(String itemId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (expanded != null) {
      return expanded(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult none(ItemActionNone value),
    @required TResult expanded(ItemActionExpanded value),
    @required TResult editing(ItemActionEditing value),
  }) {
    assert(none != null);
    assert(expanded != null);
    assert(editing != null);
    return expanded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult none(ItemActionNone value),
    TResult expanded(ItemActionExpanded value),
    TResult editing(ItemActionEditing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (expanded != null) {
      return expanded(this);
    }
    return orElse();
  }
}

abstract class ItemActionExpanded extends ItemActionState {
  const ItemActionExpanded._() : super._();
  const factory ItemActionExpanded(String itemId) = _$ItemActionExpanded;

  String get itemId;
  @JsonKey(ignore: true)
  $ItemActionExpandedCopyWith<ItemActionExpanded> get copyWith;
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
    Object itemId = freezed,
  }) {
    return _then(ItemActionEditing(
      itemId == freezed ? _value.itemId : itemId as String,
    ));
  }
}

/// @nodoc
class _$ItemActionEditing extends ItemActionEditing {
  const _$ItemActionEditing(this.itemId)
      : assert(itemId != null),
        super._();

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
  TResult when<TResult extends Object>({
    @required TResult none(),
    @required TResult expanded(String itemId),
    @required TResult editing(String itemId),
  }) {
    assert(none != null);
    assert(expanded != null);
    assert(editing != null);
    return editing(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult none(),
    TResult expanded(String itemId),
    TResult editing(String itemId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (editing != null) {
      return editing(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult none(ItemActionNone value),
    @required TResult expanded(ItemActionExpanded value),
    @required TResult editing(ItemActionEditing value),
  }) {
    assert(none != null);
    assert(expanded != null);
    assert(editing != null);
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult none(ItemActionNone value),
    TResult expanded(ItemActionExpanded value),
    TResult editing(ItemActionEditing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class ItemActionEditing extends ItemActionState {
  const ItemActionEditing._() : super._();
  const factory ItemActionEditing(String itemId) = _$ItemActionEditing;

  String get itemId;
  @JsonKey(ignore: true)
  $ItemActionEditingCopyWith<ItemActionEditing> get copyWith;
}

/// @nodoc
class _$SelectedShoppingListStateTearOff {
  const _$SelectedShoppingListStateTearOff();

// ignore: unused_element
  _SelectedShoppingListState call(@nullable ShoppingList list,
      {ItemActionState itemActionState = const ItemActionState.none()}) {
    return _SelectedShoppingListState(
      list,
      itemActionState: itemActionState,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SelectedShoppingListState = _$SelectedShoppingListStateTearOff();

/// @nodoc
mixin _$SelectedShoppingListState {
  @nullable
  ShoppingList get list;
  ItemActionState get itemActionState;

  @JsonKey(ignore: true)
  $SelectedShoppingListStateCopyWith<SelectedShoppingListState> get copyWith;
}

/// @nodoc
abstract class $SelectedShoppingListStateCopyWith<$Res> {
  factory $SelectedShoppingListStateCopyWith(SelectedShoppingListState value,
          $Res Function(SelectedShoppingListState) then) =
      _$SelectedShoppingListStateCopyWithImpl<$Res>;
  $Res call({@nullable ShoppingList list, ItemActionState itemActionState});

  $ShoppingListCopyWith<$Res> get list;
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
    Object list = freezed,
    Object itemActionState = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed ? _value.list : list as ShoppingList,
      itemActionState: itemActionState == freezed
          ? _value.itemActionState
          : itemActionState as ItemActionState,
    ));
  }

  @override
  $ShoppingListCopyWith<$Res> get list {
    if (_value.list == null) {
      return null;
    }
    return $ShoppingListCopyWith<$Res>(_value.list, (value) {
      return _then(_value.copyWith(list: value));
    });
  }

  @override
  $ItemActionStateCopyWith<$Res> get itemActionState {
    if (_value.itemActionState == null) {
      return null;
    }
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
  $Res call({@nullable ShoppingList list, ItemActionState itemActionState});

  @override
  $ShoppingListCopyWith<$Res> get list;
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
    Object list = freezed,
    Object itemActionState = freezed,
  }) {
    return _then(_SelectedShoppingListState(
      list == freezed ? _value.list : list as ShoppingList,
      itemActionState: itemActionState == freezed
          ? _value.itemActionState
          : itemActionState as ItemActionState,
    ));
  }
}

/// @nodoc
class _$_SelectedShoppingListState implements _SelectedShoppingListState {
  const _$_SelectedShoppingListState(@nullable this.list,
      {this.itemActionState = const ItemActionState.none()})
      : assert(itemActionState != null);

  @override
  @nullable
  final ShoppingList list;
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
  const factory _SelectedShoppingListState(@nullable ShoppingList list,
      {ItemActionState itemActionState}) = _$_SelectedShoppingListState;

  @override
  @nullable
  ShoppingList get list;
  @override
  ItemActionState get itemActionState;
  @override
  @JsonKey(ignore: true)
  _$SelectedShoppingListStateCopyWith<_SelectedShoppingListState> get copyWith;
}
