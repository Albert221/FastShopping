import 'package:bloc_test/bloc_test.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

class MockUuid extends Mock implements Uuid {}

class MockAppSettingsRepository extends Mock implements AppSettingsRepository {}

class MockShoppingListRepository extends Mock
    implements ShoppingListRepository {}

class MockShoppingListsCubit extends MockBloc<ShoppingListsState>
    implements ShoppingListsCubit {}
