import 'package:flutter/material.dart';

class BetterSimpleDialog extends StatelessWidget {
  const BetterSimpleDialog({
    Key? key,
    this.title,
    this.titlePadding =
        const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    this.titleTextStyle,
    this.contentPadding = const EdgeInsets.only(bottom: 8),
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.shape,
    this.children,
  }) : super(key: key);

  final Widget? title;
  final EdgeInsetsGeometry titlePadding;
  final TextStyle? titleTextStyle;
  final EdgeInsetsGeometry contentPadding;
  final Color? backgroundColor;
  final double? elevation;
  final String? semanticLabel;
  final ShapeBorder? shape;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: title,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
      contentPadding: contentPadding,
      backgroundColor: backgroundColor,
      elevation: elevation,
      semanticLabel: semanticLabel,
      shape: shape,
      children: children,
    );
  }
}

class BetterSimpleDialogOption extends StatelessWidget {
  const BetterSimpleDialogOption({
    Key? key,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.child,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      padding: padding,
      child: child,
    );
  }
}
