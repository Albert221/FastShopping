import 'package:flutter/material.dart';

class PrimaryFlatButton extends StatelessWidget {
  const PrimaryFlatButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  static const textColor = Color(0xFF4D3900);
  static const buttonColor = Color(0xFFFFF0C3);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: buttonColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: textColor),
      ),
    );
  }
}

class SecondaryFlatButton extends StatelessWidget {
  const SecondaryFlatButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  static const textColor = Color(0xFF4D3900);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: textColor),
      ),
    );
  }
}

class DangerFlatButton extends StatelessWidget {
  const DangerFlatButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  static const textColor = Color(0xFFD32F2F);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: textColor),
      ),
    );
  }
}
