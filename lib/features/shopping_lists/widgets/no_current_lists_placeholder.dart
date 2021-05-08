import 'package:flutter/material.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentTabPlaceholder extends StatelessWidget {
  const CurrentTabPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/shopping_bags_woman.svg', width: 250),
        const SizedBox(height: 32),
        Text(S.of(context)!.no_current_lists_message),
      ],
    );
  }
}
