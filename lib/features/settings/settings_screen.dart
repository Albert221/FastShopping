import 'package:fast_shopping/features/items/widgets/app_logo.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  static const _supportAuthorUrl = 'https://wolszon.me/support-me';
  static const _projectPage = 'https://github.com/Albert221/FastShopping';

  void _onLicensesTap(BuildContext context) {
    showLicensePage(
      context: context,
      applicationName: '',
      applicationIcon: const AppLogo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings_title),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          ListTile(
            leading: const Icon(Icons.nights_stay),
            title: Text(S.of(context).settings_dark_mode),
            subtitle: Text(S.of(context).settings_dark_mode_system),
            onTap: () {}, // TODO
          ),
          ListTile(
            leading: const Icon(Icons.view_stream),
            title: Text(S.of(context).settings_layout),
            subtitle: Text(S.of(context).settings_layout_comfortable),
            onTap: () {}, // TODO
          ),
          SwitchListTile(
            secondary: const Icon(Icons.low_priority),
            title: Text(S.of(context).settings_move_done),
            value: true,
            onChanged: (_) {}, // TODO
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
