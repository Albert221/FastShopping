import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FastShoppingTheme {
  static ThemeData light() {
    const primary = Color(0xFFFFC107);
    const button = Color(0xFF4D3900);
    const text = Colors.black;

    final defaultTextTheme =
        Typography.material2014(platform: defaultTargetPlatform).black;
    final theme = ThemeData.from(
      colorScheme: const ColorScheme(
        primary: primary,
        primaryVariant: primary,
        secondary: primary,
        secondaryVariant: primary,
        surface: Colors.white,
        background: Color(0xFFF1F1F1),
        error: Color(0xFFD32F2F),
        onPrimary: text,
        onSecondary: text,
        onSurface: text,
        onBackground: text,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      textTheme: defaultTextTheme.copyWith(
        bodyText2: defaultTextTheme.bodyText2.copyWith(
          fontSize: 16,
        ),
      ),
    );

    return theme.copyWith(
      bottomAppBarColor: primary,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: button,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

extension TextButtonStyles on TextButton {
  Widget get primary {
    return TextButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFFFF0C3),
      ).merge(style),
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      child: child,
    );
  }

  Widget get danger {
    return Builder(
      builder: (context) => TextButton(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: TextButton.styleFrom(
          primary: Theme.of(context).colorScheme.error,
        ).merge(style),
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: child,
      ),
    );
  }
}
