import 'package:flutter/material.dart';

class AnimatedLineThroughText extends StatelessWidget {
  const AnimatedLineThroughText(
    this.data, {
    Key? key,
    required this.stroked,
    required this.duration,
    this.curve = Curves.linear,
    this.style,
  }) : super(key: key);

  final String data;
  final bool stroked;
  final Duration duration;
  final Curve curve;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final chars = data.characters;

    final length = chars.length;
    final strokedLength = stroked ? chars.length : 0;

    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: strokedLength, end: strokedLength),
      duration: duration,
      curve: curve,
      builder: (context, value, _) {
        final strokedLength = value.clamp(0, length).toInt();

        return Text.rich(TextSpan(
          children: [
            TextSpan(
              text: chars.getRange(0, strokedLength).toString(),
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
              ).merge(style),
            ),
            TextSpan(
              text: chars.getRange(strokedLength, length).toString(),
              style: style,
            )
          ],
        ));
      },
    );
  }
}
