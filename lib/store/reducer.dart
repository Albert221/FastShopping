import 'package:fast_shopping/store/store.dart';

FastShoppingState rootReducer(FastShoppingState state, dynamic action) {
  return state
      .rebuild((b) => b..items.replace(itemsReducer(state.items, action)));
}
