import 'package:fast_shopping/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

extension StoreExtension on BuildContext {
  Store<FastShoppingState> get store =>
      StoreProvider.of<FastShoppingState>(this);
}
