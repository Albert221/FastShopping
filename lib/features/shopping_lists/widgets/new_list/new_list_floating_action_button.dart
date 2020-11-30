import 'package:animations/animations.dart';
import 'package:clock/clock.dart';
import 'package:fast_shopping/features/shopping_lists/widgets/new_list/new_list_dialog.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:fast_shopping_bloc/shopping_lists.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class NewListFloatingActionButton extends StatelessWidget {
  const NewListFloatingActionButton({
    Key key,
    @required this.shoppingListsCubit,
    @required this.clock,
  }) : super(key: key);

  final ShoppingListsCubit shoppingListsCubit;
  final Clock clock;

  Future<void> _onNewListTapped(BuildContext context) async {
    final name = await showModal<String>(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(),
      builder: (context) => const NewListDialog(),
    );

    if (name == null) return;

    final shoppingList = ShoppingList(
      id: Uuid().v4(),
      createdAt: clock.now(),
      name: name,
    );

    shoppingListsCubit
      ..add(shoppingList)
      ..select(shoppingList.id);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _onNewListTapped(context),
      icon: const Icon(Icons.add),
      label: Text(S.of(context).shopping_lists_add_new),
    );
  }
}
