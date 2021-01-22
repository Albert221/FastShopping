import 'package:animations/animations.dart';
import 'package:fast_shopping/features/support_author/support_author_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';

import 'app_logo.dart';

enum _ItemsAppBarAction { supportAuthor, licenses }

class ItemsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ItemsAppBar({Key key}) : super(key: key);

  void _onActionSelected(BuildContext context, _ItemsAppBarAction action) {
    switch (action) {
      case _ItemsAppBarAction.supportAuthor:
        showModal(
          context: context,
          configuration: const FadeScaleTransitionConfiguration(),
          builder: (context) => const SupportAuthorDialog(),
        );
        break;

      case _ItemsAppBarAction.licenses:
        showLicensePage(
          context: context,
          applicationName: '',
          applicationIcon: const AppLogo(),
        );
        break;
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const AppLogo(),
      actions: [
        PopupMenuButton<_ItemsAppBarAction>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: _ItemsAppBarAction.supportAuthor,
              child: Row(
                children: [
                  const Icon(Icons.attach_money),
                  const SizedBox(width: 16),
                  Text(S.of(context).menu_support_author),
                ],
              ),
            ),
            PopupMenuItem(
              value: _ItemsAppBarAction.licenses,
              child: Row(
                children: [
                  const Icon(Icons.info_outline),
                  const SizedBox(width: 16),
                  Text(S.of(context).menu_licenses),
                ],
              ),
            ),
          ],
          onSelected: (index) => _onActionSelected(context, index),
        ),
      ],
    );
  }
}
