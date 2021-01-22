import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

class ShoppingListTileDetails extends StatelessWidget {
  const ShoppingListTileDetails({Key key, @required this.shoppingList})
      : super(key: key);

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: S.of(context).shopping_lists_item_elements(
                  shoppingList.availableItems.length,
                ),
          ),
          const TextSpan(text: ' • '),
          if (shoppingList.archivedAt != null)
            TextSpan(
              text: S.of(context).shopping_lists_item_archived_at(
                    shoppingList.archivedAt.timeAgo(context),
                  ),
            )
          else
            TextSpan(
              text: S.of(context).shopping_lists_item_created_at(
                    shoppingList.createdAt.timeAgo(context),
                  ),
            ),
        ],
        style: TextStyle(
          color: Theme.of(context).textTheme.caption.color,
          fontSize: 15,
        ),
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
