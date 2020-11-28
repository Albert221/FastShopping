import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';
import 'package:fast_shopping_bloc/shopping_lists.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/item.dart';
import '../models/shopping_list.dart';

part 'selected_shopping_list_cubit.freezed.dart';

class SelectedShoppingListCubit extends Cubit<SelectedShoppingListState> {
  SelectedShoppingListCubit(this._listsCubit, this._clock)
      : super(SelectedShoppingListState(_listsCubit.state.selected));

  final ShoppingListsCubit _listsCubit;
  final Clock _clock;

  // ignore: avoid_positional_boolean_parameters
  void setDone(String itemId, bool done) {
    _updateItem(
      itemId,
      (item) => item.copyWith(doneAt: done ? _clock.now() : null),
    );
  }

  void setTitle(String itemId, String newTitle) {
    _updateItem(itemId, (item) => item.copyWith(title: newTitle));
  }

  void _updateItem(String itemId, Item Function(Item) itemUpdate) {
    _listsCubit.update(state.list.copyWith(
      items: state.list.items
          .map((item) => item.id == itemId ? itemUpdate(item) : item)
          .toList(),
    ));
  }

  void expandItem(String itemId) {
    emit(state.copyWith(itemActionState: ItemActionState.expanded(itemId)));
  }

  void collapseItem() {
    emit(state.copyWith(itemActionState: const ItemActionState.none()));
  }

  void startEditing() {
    state.itemActionState.maybeWhen(
      editing: (itemId) {
        emit(state.copyWith(itemActionState: ItemActionState.editing(itemId)));
      },
      orElse: () {},
    );
  }

  void stopEditing() {
    state.itemActionState.maybeWhen(
      editing: (itemId) {
        emit(state.copyWith(itemActionState: ItemActionState.expanded(itemId)));
      },
      orElse: () {},
    );
  }
}

@freezed
abstract class ItemActionState with _$ItemActionState {
  const factory ItemActionState.none() = ItemActionNone;
  const factory ItemActionState.expanded(String itemId) = ItemActionExpanded;
  const factory ItemActionState.editing(String itemId) = ItemActionEditing;
}

@freezed
abstract class SelectedShoppingListState with _$SelectedShoppingListState {
  const factory SelectedShoppingListState(
    @nullable ShoppingList list, {
    @Default(ItemActionState.none()) ItemActionState itemActionState,
  }) = _SelectedShoppingListState;
}
