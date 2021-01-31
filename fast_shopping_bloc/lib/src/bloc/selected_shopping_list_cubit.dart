import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'selected_shopping_list_cubit.freezed.dart';

class SelectedShoppingListCubit extends Cubit<SelectedShoppingListState> {
  SelectedShoppingListCubit(this._listsCubit, this._clock, this._uuid)
      : super(SelectedShoppingListState(_listsCubit.state.selected)) {
    _listsCubitSubscription = _listsCubit
        .listen((state) => emit(this.state.copyWith(list: state.selected)));
  }

  final ShoppingListsCubit _listsCubit;
  final Clock _clock;
  final Uuid _uuid;
  StreamSubscription _listsCubitSubscription;

  @override
  Future<void> close() async {
    await _listsCubitSubscription.cancel();
    return super.close();
  }

  void addItem(String title) {
    _assertListSelected();

    _listsCubit.update(state.list.copyWith(
      items: List.of(state.list.items)
        ..add(Item(
          id: _uuid.v4(),
          title: title,
        )),
    ));
  }

  void removeItem(String itemId) {
    _updateItemAndEmit(itemId, (item) => item.copyWith(removed: true));
  }

  void removeAllDoneItems() {
    _assertListSelected();

    _listsCubit.update(state.list.copyWith(
      items: List.of(state.list.items)..removeWhere((item) => item.done),
    ));
  }

  void undoRemoveItem(String itemId) {
    _updateItemAndEmit(itemId, (item) => item.copyWith(removed: false));
  }

  /// [oldIndex] and [newIndex] refer to indices
  /// in the [state.list.availableItems].
  void moveItem(int oldIndex, int newIndex) {
    _assertListSelected();

    final newList = _moveItem(
      state.list,
      oldIndex,
      newIndex,
      availableItemsIndices: true,
    );

    _listsCubit.update(newList);
  }

  // ignore: avoid_positional_boolean_parameters
  void setItemDone(String itemId, bool done, {bool moveDoneToEnd = false}) {
    Item update(Item item) => item.copyWith(doneAt: done ? _clock.now() : null);

    if (!moveDoneToEnd) {
      _updateItemAndEmit(itemId, update);
      return;
    }

    _assertListSelected();

    /// There is a case when the user has few items, some of which are done
    /// and are not positioned at the end of the list. That's why we search
    /// the reversed list for first NOT done item and put the related item
    /// just after that (in the not reversed order).
    ///
    ///     index done  reversed index
    ///     0     yes   6
    ///     1     YES   5   <-- our item
    ///     2     no    4
    ///     3     yes   3
    ///     4     yes   2   list length = 7
    ///     5     no    1
    ///     6     no    0
    ///
    ///     newReversedIndex = 2
    ///     newIndex = length - newReversedIndex = 5
    ///
    /// The final new index is the `newIndex`. Before passing it as a target
    /// index should be decremented by 1 because the old item is deleted
    /// from the old index.
    ///
    /// This works both when the user marks the item as done when it's moved
    /// to the top of the last group of done items as well as when the done
    /// item is marked undone but at the same time was at this last done items
    /// group.
    int indexBeforeLastGroupOfDoneItems() {
      final newReversedIndex =
          state.list.items.reversed.toList().indexWhere((item) => !item.done);
      final newIndex = state.list.items.length - newReversedIndex;
      return newIndex;
    }

    final oldIndex = state.list.items.indexWhere((item) => item.id == itemId);
    final newIndex = indexBeforeLastGroupOfDoneItems();
    var newList = _updateItem(state.list, itemId, update);

    if (done) {
      newList = _moveItem(newList, oldIndex, newIndex - 1);
    } else if (oldIndex > newIndex) {
      newList = _moveItem(newList, oldIndex, newIndex);
    }

    _listsCubit.update(newList);
  }

  /// `availableItemsIndices` decides whether the `oldIndex` and `newIndex`
  /// correspond to the `items` or `availableItems` from the `list`.
  static ShoppingList _moveItem(
    ShoppingList list,
    int oldIndex,
    int newIndex, {
    bool availableItemsIndices = false,
  }) {
    int mapAvailable(int index) {
      final id = list.availableItems[index].id;
      return list.items.indexWhere((item) => item.id == id);
    }

    final _oldIndex = availableItemsIndices ? mapAvailable(oldIndex) : oldIndex;
    final _newIndex = availableItemsIndices ? mapAvailable(newIndex) : newIndex;

    final items = List.of(list.items);
    final item = items.removeAt(_oldIndex);
    items.insert(_newIndex, item);

    return list.copyWith(items: items);
  }

  void setAllItemsUndone() {
    _assertListSelected();

    _listsCubit.update(state.list.copyWith(
      items: state.list.items.map((item) {
        return item.copyWith(doneAt: null);
      }).toList(),
    ));
  }

  void setItemTitle(String itemId, String newTitle) {
    _updateItemAndEmit(itemId, (item) => item.copyWith(title: newTitle.trim()));
  }

  /// Updates an item with specified `itemId` from the selected shopping
  /// list in [state] and emits it (sends above to the shopping lists cubit).
  void _updateItemAndEmit(String itemId, Item Function(Item) itemUpdate) {
    _assertListSelected();

    _listsCubit.update(_updateItem(state.list, itemId, itemUpdate));
  }

  /// Returns a `list` with an item with id `itemId` updated with `itemUpdate`.
  static ShoppingList _updateItem(
    ShoppingList list,
    String itemId,
    Item Function(Item) itemUpdate,
  ) {
    return list.copyWith(
      items: list.items
          .map((item) => item.id == itemId ? itemUpdate(item) : item)
          .toList(),
    );
  }

  void _assertListSelected() {
    if (state.list == null) {
      throw Exception(
        'You must have any shopping list selected to perform that action.',
      );
    }
  }

  void expandItem(String itemId) {
    emit(state.copyWith(itemActionState: ItemActionState.expanded(itemId)));
  }

  void collapseItem() {
    emit(state.copyWith(itemActionState: const ItemActionState.none()));
  }

  void startEditingItem() {
    state.itemActionState.maybeWhen(
      expanded: (itemId) => emit(state.copyWith(
        itemActionState: ItemActionState.editing(itemId),
      )),
      orElse: () => throw Exception(
        'Item action must be expanded before starting editing.',
      ),
    );
  }

  void stopEditingItem() {
    state.itemActionState.maybeWhen(
      editing: (itemId) => emit(state.copyWith(
        itemActionState: ItemActionState.expanded(itemId),
      )),
      orElse: () => throw Exception(
        'Item action must be editing before going back to expanded.',
      ),
    );
  }
}

@freezed
abstract class ItemActionState implements _$ItemActionState {
  const factory ItemActionState.none() = ItemActionNone;
  const factory ItemActionState.expanded(String itemId) = ItemActionExpanded;
  const factory ItemActionState.editing(String itemId) = ItemActionEditing;

  const ItemActionState._();

  bool isExpanded(String itemId) => maybeWhen(
        expanded: (id) => itemId == id,
        editing: (id) => itemId == id,
        orElse: () => false,
      );

  bool isEditing(String itemId) => maybeWhen(
        editing: (id) => itemId == id,
        orElse: () => false,
      );
}

@freezed
abstract class SelectedShoppingListState with _$SelectedShoppingListState {
  const factory SelectedShoppingListState(
    @nullable ShoppingList list, {
    @Default(ItemActionState.none()) ItemActionState itemActionState,
  }) = _SelectedShoppingListState;
}
