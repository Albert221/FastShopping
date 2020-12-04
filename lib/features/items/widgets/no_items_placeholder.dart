import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoItemsPlaceholder extends StatelessWidget {
  const NoItemsPlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.only(bottom: 32),
            alignment: Alignment.bottomCenter,
            child: Text(
              S.of(context).empty_list_add_some_items_message,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 94, bottom: 36),
            child: SvgPicture.asset(
              'assets/arrow_fab.svg',
              alignment: Alignment.bottomRight,
              height: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
