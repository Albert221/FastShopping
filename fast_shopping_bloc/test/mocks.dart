import 'package:bloc_test/bloc_test.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:uuid/uuid.dart';

export 'mocks.mocks.dart';

@GenerateMocks([
  Uuid,
  AppSettingsRepository,
  ShoppingListRepository,
])
// ignore: unused_element
class _Mocks {}

class MockShoppingListsCubit extends MockCubit<ShoppingListsState>
    implements ShoppingListsCubit {}
