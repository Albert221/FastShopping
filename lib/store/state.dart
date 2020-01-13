import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:fast_shopping/models/models.dart';

part 'state.g.dart';

abstract class FastShoppingState
    implements Built<FastShoppingState, FastShoppingStateBuilder> {
  BuiltList<Item> get items;

  FastShoppingState._();
  factory FastShoppingState([void Function(FastShoppingStateBuilder) updates]) {
    return _$FastShoppingState
        ._(
          items: BuiltList<Item>(),
        )
        .rebuild(updates);
  }
}
