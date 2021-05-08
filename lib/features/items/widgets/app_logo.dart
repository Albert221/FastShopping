import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/logo.svg',
          width: 32,
          height: 32,
          color: DefaultTextStyle.of(context).style.color,
        ),
        const SizedBox(width: 16),
        Text(
          S.of(context)!.app_title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
