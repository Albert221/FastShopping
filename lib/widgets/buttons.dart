import 'package:flutter/material.dart';

class PrimaryFlatButton extends StatelessWidget {
  static const textColor = Color(0xFF4D3900);
  static const buttonColor = Color(0xFFFFF0C3);

  final String text;
  final VoidCallback onPressed;

  const PrimaryFlatButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: const TextStyle(color: textColor),
      ),
      color: buttonColor,
      onPressed: onPressed,
    );
  }
}

class DangerFlatButton extends StatelessWidget {
  static const textColor = Color(0xFFD32F2F);

  final String text;
  final VoidCallback onPressed;

  const DangerFlatButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: const TextStyle(color: textColor),
      ),
      onPressed: onPressed,
    );
  }
}
