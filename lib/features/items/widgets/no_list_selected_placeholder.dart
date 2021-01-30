import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoListSelectedPlaceholder extends StatelessWidget {
  const NoListSelectedPlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.only(bottom: 32),
            alignment: Alignment.bottomCenter,
            child: Text(
              S.of(context).shopping_list_not_selected_message,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 20),
            child: SvgPicture.asset(
              'assets/arrow_bottom_app_bar.svg',
              alignment: Alignment.bottomLeft,
              height: double.infinity,
              color: DefaultTextStyle.of(context).style.color,
            ),
          ),
        ),
      ],
    );
  }
}
