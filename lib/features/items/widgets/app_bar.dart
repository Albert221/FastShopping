import 'package:fast_shopping/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';

import 'app_logo.dart';

class ItemsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ItemsAppBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const AppLogo(),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          ),
        ),
      ],
    );
  }
}
