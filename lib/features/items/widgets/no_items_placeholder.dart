import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoItemsPlaceholder extends StatelessWidget {
  const NoItemsPlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/gone_shopping.svg',
                width: 150,
              ),
              const SizedBox(height: 32),
              Text(
                S.of(context).empty_list_add_some_items_message,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
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
