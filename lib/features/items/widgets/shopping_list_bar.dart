import 'package:fast_shopping/features/shopping_lists/shopping_lists_screen.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter/material.dart';

class ShoppingListBar extends StatelessWidget {
  const ShoppingListBar({Key key, @required this.shoppingList})
      : super(key: key);

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const ShoppingListsScreen(),
        )),
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
    );
  }
}
