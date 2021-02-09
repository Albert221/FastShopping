import 'package:animations/animations.dart';
import 'package:fast_shopping/features/shopping_lists/shopping_lists_screen.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ShoppingListBar extends HookWidget {
  const ShoppingListBar({Key key, @required this.shoppingList})
      : super(key: key);

  static const _requiredDragOffset = 100;

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    final verticalDrag = useState<double>(0);

    return BottomAppBar(
      notchMargin: 8,
      child: OpenContainer(
        closedColor: Theme.of(context).bottomAppBarColor,
        closedElevation: 0,
        closedShape: const ContinuousRectangleBorder(),
        openBuilder: (context, _) => const ShoppingListsScreen(),
        closedBuilder: (context, open) => GestureDetector(
          onVerticalDragUpdate: (details) =>
              verticalDrag.value += details.primaryDelta,
          onVerticalDragEnd: (details) {
            if (-verticalDrag.value >= _requiredDragOffset) {
              open();
            }

            verticalDrag.value = 0;
          },
          child: InkWell(
            onTap: open,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.list),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: shoppingList == null
                      ? Text(
                          S.of(context).shopping_list_not_selected_placeholder,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                          overflow: TextOverflow.ellipsis,
                        )
                      : Text(
                          shoppingList.name.isNotEmpty
                              ? shoppingList.name
                              : S.of(context).shopping_list_no_name,
                          style: shoppingList.name.isEmpty
                              ? const TextStyle(fontStyle: FontStyle.italic)
                              : null,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
