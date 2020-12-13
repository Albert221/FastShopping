import 'package:fast_shopping/features/shopping_lists/widgets/shopping_list_tile/shopping_list_tile_details.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping_bloc/models.dart';
import 'package:flutter/material.dart';

import 'actions_menu.dart';

enum ShoppingListActions { rename, archive, unarchive, delete }

class ShoppingListTile extends StatelessWidget {
  const ShoppingListTile({
    Key key,
    @required this.shoppingList,
    this.current = false,
    this.onTap,
    this.onRenameTap,
    this.onArchiveTap,
    this.onUnarchiveTap,
    this.onDeleteTap,
  }) : super(key: key);

  final ShoppingList shoppingList;
  final bool current;
  final VoidCallback onTap;
  final VoidCallback onRenameTap;
  final VoidCallback onArchiveTap;
  final VoidCallback onUnarchiveTap;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    final background = current
        ? Theme.of(context).colorScheme.primary.withOpacity(.2)
        : Theme.of(context).colorScheme.surface;

    return TweenAnimationBuilder<Color>(
      tween: ColorTween(begin: background, end: background),
      curve: standardEasing,
      duration: const Duration(milliseconds: 300),
      builder: (context, background, child) => Material(
        color: background,
        child: child,
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.black12),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.list, color: Colors.black45),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Text(
                          shoppingList.name.isNotEmpty
                              ? shoppingList.name
                              : S.of(context).shopping_list_no_name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                fontStyle: shoppingList.name.isEmpty
                                    ? FontStyle.italic
                                    : null,
                                fontWeight: current ? FontWeight.w500 : null,
                              ),
                        ),
                      ),
                      const SizedBox(width: 36),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 48),
                    child: ShoppingListTileDetails(shoppingList: shoppingList),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 4,
              child: ActionsMenu(
                onRenameTap: onRenameTap,
                onArchiveTap: onArchiveTap,
                onUnarchiveTap: onUnarchiveTap,
                onDeleteTap: onDeleteTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
