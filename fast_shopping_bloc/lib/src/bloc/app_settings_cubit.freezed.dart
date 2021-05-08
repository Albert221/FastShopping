// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppSettingsTearOff {
  const _$AppSettingsTearOff();

  _AppSettings call(
      {ShoppingListsMode shoppingListsMode = ShoppingListsMode.multiple,
      DarkTheme darkTheme = DarkTheme.system,
      ItemsLayout itemsLayout = ItemsLayout.comfortable,
      bool moveDoneToEnd = false}) {
    return _AppSettings(
      shoppingListsMode: shoppingListsMode,
      darkTheme: darkTheme,
      itemsLayout: itemsLayout,
      moveDoneToEnd: moveDoneToEnd,
    );
  }
}

/// @nodoc
const $AppSettings = _$AppSettingsTearOff();

/// @nodoc
mixin _$AppSettings {
  ShoppingListsMode get shoppingListsMode => throw _privateConstructorUsedError;
  DarkTheme get darkTheme => throw _privateConstructorUsedError;
  ItemsLayout get itemsLayout => throw _privateConstructorUsedError;
  bool get moveDoneToEnd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res>;
  $Res call(
      {ShoppingListsMode shoppingListsMode,
      DarkTheme darkTheme,
      ItemsLayout itemsLayout,
      bool moveDoneToEnd});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res> implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  final AppSettings _value;
  // ignore: unused_field
  final $Res Function(AppSettings) _then;

  @override
  $Res call({
    Object? shoppingListsMode = freezed,
    Object? darkTheme = freezed,
    Object? itemsLayout = freezed,
    Object? moveDoneToEnd = freezed,
  }) {
    return _then(_value.copyWith(
      shoppingListsMode: shoppingListsMode == freezed
          ? _value.shoppingListsMode
          : shoppingListsMode // ignore: cast_nullable_to_non_nullable
              as ShoppingListsMode,
      darkTheme: darkTheme == freezed
          ? _value.darkTheme
          : darkTheme // ignore: cast_nullable_to_non_nullable
              as DarkTheme,
      itemsLayout: itemsLayout == freezed
          ? _value.itemsLayout
          : itemsLayout // ignore: cast_nullable_to_non_nullable
              as ItemsLayout,
      moveDoneToEnd: moveDoneToEnd == freezed
          ? _value.moveDoneToEnd
          : moveDoneToEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AppSettingsCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(
          _AppSettings value, $Res Function(_AppSettings) then) =
      __$AppSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {ShoppingListsMode shoppingListsMode,
      DarkTheme darkTheme,
      ItemsLayout itemsLayout,
      bool moveDoneToEnd});
}

/// @nodoc
class __$AppSettingsCopyWithImpl<$Res> extends _$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(
      _AppSettings _value, $Res Function(_AppSettings) _then)
      : super(_value, (v) => _then(v as _AppSettings));

  @override
  _AppSettings get _value => super._value as _AppSettings;

  @override
  $Res call({
    Object? shoppingListsMode = freezed,
    Object? darkTheme = freezed,
    Object? itemsLayout = freezed,
    Object? moveDoneToEnd = freezed,
  }) {
    return _then(_AppSettings(
      shoppingListsMode: shoppingListsMode == freezed
          ? _value.shoppingListsMode
          : shoppingListsMode // ignore: cast_nullable_to_non_nullable
              as ShoppingListsMode,
      darkTheme: darkTheme == freezed
          ? _value.darkTheme
          : darkTheme // ignore: cast_nullable_to_non_nullable
              as DarkTheme,
      itemsLayout: itemsLayout == freezed
          ? _value.itemsLayout
          : itemsLayout // ignore: cast_nullable_to_non_nullable
              as ItemsLayout,
      moveDoneToEnd: moveDoneToEnd == freezed
          ? _value.moveDoneToEnd
          : moveDoneToEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AppSettings implements _AppSettings {
  const _$_AppSettings(
      {this.shoppingListsMode = ShoppingListsMode.multiple,
      this.darkTheme = DarkTheme.system,
      this.itemsLayout = ItemsLayout.comfortable,
      this.moveDoneToEnd = false});

  @JsonKey(defaultValue: ShoppingListsMode.multiple)
  @override
  final ShoppingListsMode shoppingListsMode;
  @JsonKey(defaultValue: DarkTheme.system)
  @override
  final DarkTheme darkTheme;
  @JsonKey(defaultValue: ItemsLayout.comfortable)
  @override
  final ItemsLayout itemsLayout;
  @JsonKey(defaultValue: false)
  @override
  final bool moveDoneToEnd;

  @override
  String toString() {
    return 'AppSettings(shoppingListsMode: $shoppingListsMode, darkTheme: $darkTheme, itemsLayout: $itemsLayout, moveDoneToEnd: $moveDoneToEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppSettings &&
            (identical(other.shoppingListsMode, shoppingListsMode) ||
                const DeepCollectionEquality()
                    .equals(other.shoppingListsMode, shoppingListsMode)) &&
            (identical(other.darkTheme, darkTheme) ||
                const DeepCollectionEquality()
                    .equals(other.darkTheme, darkTheme)) &&
            (identical(other.itemsLayout, itemsLayout) ||
                const DeepCollectionEquality()
                    .equals(other.itemsLayout, itemsLayout)) &&
            (identical(other.moveDoneToEnd, moveDoneToEnd) ||
                const DeepCollectionEquality()
                    .equals(other.moveDoneToEnd, moveDoneToEnd)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(shoppingListsMode) ^
      const DeepCollectionEquality().hash(darkTheme) ^
      const DeepCollectionEquality().hash(itemsLayout) ^
      const DeepCollectionEquality().hash(moveDoneToEnd);

  @JsonKey(ignore: true)
  @override
  _$AppSettingsCopyWith<_AppSettings> get copyWith =>
      __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      {ShoppingListsMode shoppingListsMode,
      DarkTheme darkTheme,
      ItemsLayout itemsLayout,
      bool moveDoneToEnd}) = _$_AppSettings;

  @override
  ShoppingListsMode get shoppingListsMode => throw _privateConstructorUsedError;
  @override
  DarkTheme get darkTheme => throw _privateConstructorUsedError;
  @override
  ItemsLayout get itemsLayout => throw _privateConstructorUsedError;
  @override
  bool get moveDoneToEnd => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppSettingsCopyWith<_AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
