import 'package:fast_shopping/features/shopping_lists/shopping_lists_screen.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ShoppingListBar extends StatelessWidget {
  const ShoppingListBar({Key key}) : super(key: key);

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
              child: Text(
                S.of(context).shopping_list_not_selected_placeholder,
                style: const TextStyle(fontStyle: FontStyle.italic),
                overflow: TextOverflow.ellipsis,
              ),
              // : Text(
              //     list.name.isNotEmpty
              //         ? list.name
              //         : S.of(context).shopping_list_no_name,
              //     style: list.name.isEmpty
              //         ? const TextStyle(fontStyle: FontStyle.italic)
              //         : null,
              //     overflow: TextOverflow.ellipsis,
              //   ),
            ),
          ],
        ),
      ),
    );
  }
}
