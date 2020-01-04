import 'package:fast_shopping/i18n/i18n.dart';
import 'package:fast_shopping/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ArchiveBanner extends StatelessWidget {
  final VoidCallback onArchiveTap;

  const ArchiveBanner({Key key, @required this.onArchiveTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 4),
            child: Text(
              'archive_banner_content'.i18n,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SecondaryFlatButton(
                text: 'archive_banner_archive'.i18n,
                onPressed: onArchiveTap,
              ),
            ),
          ),
          const Divider(
            height: 0,
            color: Colors.black12,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
