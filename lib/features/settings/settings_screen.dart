import 'package:animations/animations.dart';
import 'package:fast_shopping/features/common/better_simple_dialog.dart';
import 'package:fast_shopping/features/items/widgets/app_logo.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  static const _supportAuthorUrl = 'https://wolszon.me/support-me';
  static const _projectPage = 'https://github.com/Albert221/FastShopping';

  Future<void> _onDarkModeTap(BuildContext context) async {
    final darkMode = await showModal<DarkMode>(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(),
      builder: (context) => BetterSimpleDialog(
        title: Text(S.of(context).settings_dark_mode),
        children: DarkMode.values.map((option) {
          return BetterSimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(option),
            child: Text(option.localize(context)),
          );
        }).toList(),
      ),
    );

    if (darkMode != null) {
      context.read<AppSettingsCubit>().setDarkMode(darkMode);
    }
  }

  Future<void> _onItemsLayoutTap(BuildContext context) async {
    final layout = await showModal<ItemsLayout>(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(),
      builder: (context) => BetterSimpleDialog(
        title: Text(S.of(context).settings_items_layout),
        children: ItemsLayout.values.map((option) {
          return BetterSimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(option),
            child: Text(option.localize(context)),
          );
        }).toList(),
      ),
    );

    if (layout != null) {
      context.read<AppSettingsCubit>().setItemsLayout(layout);
    }
  }

  void _onLicensesTap(BuildContext context) {
    showLicensePage(
      context: context,
      applicationName: '',
      applicationIcon: const AppLogo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = context.watch<AppSettingsCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings_title),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          RadioListTile<ShoppingListsMode>(
            value: ShoppingListsMode.multiple,
            groupValue: appSettings.shoppingListsMode,
            title: Text(S.of(context).settings_multiple_lists),
            subtitle: Text(S.of(context).settings_multiple_lists_subtitle),
            onChanged: (mode) =>
                context.read<AppSettingsCubit>().setShoppingListsMode(mode),
          ),
          RadioListTile<ShoppingListsMode>(
            value: ShoppingListsMode.single,
            groupValue: appSettings.shoppingListsMode,
            title: Text(S.of(context).settings_single_list),
            subtitle: Text(S.of(context).settings_single_list_subtitle),
            onChanged: (mode) =>
                context.read<AppSettingsCubit>().setShoppingListsMode(mode),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.nights_stay),
            title: Text(S.of(context).settings_dark_mode),
            subtitle: Text(appSettings.darkMode.localize(context)),
            onTap: () => _onDarkModeTap(context),
          ),
          ListTile(
            leading: const Icon(Icons.view_stream),
            title: Text(S.of(context).settings_items_layout),
            subtitle: Text(appSettings.itemsLayout.localize(context)),
            onTap: () => _onItemsLayoutTap(context),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.low_priority),
            title: Text(S.of(context).settings_move_done),
            value: appSettings.moveDoneToEnd,
            onChanged: (moveDone) =>
                context.read<AppSettingsCubit>().setMoveDoneToEnd(moveDone),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: Text(S.of(context).settings_support_author),
            onTap: () => launch(_supportAuthorUrl),
          ),
          ListTile(
            leading: const SizedBox(),
            title: Text(S.of(context).settings_project_website),
            onTap: () => launch(_projectPage),
          ),
          ListTile(
            leading: const SizedBox(),
            title: Text(S.of(context).settings_licenses),
            onTap: () => _onLicensesTap(context),
          ),
        ],
      ),
    );
  }
}
