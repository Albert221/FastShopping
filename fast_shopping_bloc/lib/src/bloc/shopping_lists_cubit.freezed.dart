// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'shopping_lists_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ShoppingListsStateTearOff {
  const _$ShoppingListsStateTearOff();

// ignore: unused_element
  _ShoppingListsState call(
      {String selectedId, List<ShoppingList> lists = const []}) {
    return _ShoppingListsState(
      selectedId: selectedId,
      lists: lists,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ShoppingListsState = _$ShoppingListsStateTearOff();

/// @nodoc
mixin _$ShoppingListsState {
  String get selectedId;
  List<ShoppingList> get lists;

  @JsonKey(ignore: true)
  $ShoppingListsStateCopyWith<ShoppingListsState> get copyWith;
}

/// @nodoc
abstract class $ShoppingListsStateCopyWith<$Res> {
  factory $ShoppingListsStateCopyWith(
          ShoppingListsState value, $Res Function(ShoppingListsState) then) =
      _$ShoppingListsStateCopyWithImpl<$Res>;
  $Res call({String selectedId, List<ShoppingList> lists});
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
    Object selectedId = freezed,
    Object lists = freezed,
  }) {
    return _then(_value.copyWith(
      selectedId:
          selectedId == freezed ? _value.selectedId : selectedId as String,
      lists: lists == freezed ? _value.lists : lists as List<ShoppingList>,
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
  $Res call({String selectedId, List<ShoppingList> lists});
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
    Object selectedId = freezed,
    Object lists = freezed,
  }) {
    return _then(_ShoppingListsState(
      selectedId:
          selectedId == freezed ? _value.selectedId : selectedId as String,
      lists: lists == freezed ? _value.lists : lists as List<ShoppingList>,
    ));
  }
}

/// @nodoc
class _$_ShoppingListsState extends _ShoppingListsState {
  _$_ShoppingListsState({this.selectedId, this.lists = const []})
      : assert(lists != null),
        super._();

  @override
  final String selectedId;
  @JsonKey(defaultValue: const [])
  @override
  final List<ShoppingList> lists;

  bool _didselected = false;
  ShoppingList _selected;

  @override
  ShoppingList get selected {
    if (_didselected == false) {
      _didselected = true;
      _selected = lists.firstWhere(
        (list) => list.id == selectedId,
        orElse: () => null,
      );
    }
    return _selected;
  }

  bool _didcurrent = false;
  List<ShoppingList> _current;

  @override
  List<ShoppingList> get current {
    if (_didcurrent == false) {
      _didcurrent = true;
      _current = lists.where((list) => list.archivedAt == null).toList();
    }
    return _current;
  }

  bool _didarchived = false;
  List<ShoppingList> _archived;

  @override
  List<ShoppingList> get archived {
    if (_didarchived == false) {
      _didarchived = true;
      _archived = lists.where((list) => list.archivedAt != null).toList();
    }
    return _archived;
  }

  @override
  String toString() {
    return 'ShoppingListsState(selectedId: $selectedId, lists: $lists, selected: $selected, current: $current, archived: $archived)';
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
  _ShoppingListsState._() : super._();
  factory _ShoppingListsState({String selectedId, List<ShoppingList> lists}) =
      _$_ShoppingListsState;

  @override
  String get selectedId;
  @override
  List<ShoppingList> get lists;
  @override
  @JsonKey(ignore: true)
  _$ShoppingListsStateCopyWith<_ShoppingListsState> get copyWith;
}
