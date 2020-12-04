import 'package:bloc_test/bloc_test.dart';
import 'package:fast_shopping_bloc/src/bloc/shopping_lists_cubit.dart';
import 'package:fast_shopping_bloc/src/data/shopping_list_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

class MockUuid extends Mock implements Uuid {}

class MockShoppingListRepository extends Mock
    implements ShoppingListRepository {}

class MockShoppingListsCubit extends MockBloc<ShoppingListsState>
    implements ShoppingListsCubit {}
