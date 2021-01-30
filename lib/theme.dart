import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FastShoppingTheme {
  static ThemeData light() {
    return _build(
      brightness: Brightness.light,
      primary: const Color(0xFFFFC107),
      button: const Color(0xFF4D3900),
      text: Colors.black,
      surface: Colors.white,
      background: const Color(0xFFF1F1F1),
      error: const Color(0xFFD32F2F),
      onError: Colors.white,
    );
  }

  static ThemeData dark() {
    return _build(
      brightness: Brightness.dark,
      primary: const Color(0xFFFFC107),
      button: const Color(0xFF4D3900),
      text: Colors.white,
      surface: const Color(0xFF222222),
      background: Colors.black,
      error: const Color(0xFFD32F2F),
      onError: Colors.white,
    );
  }

  static ThemeData _build({
    Brightness brightness,
    Color primary,
    Color button,
    Color text,
    Color surface,
    Color background,
    Color error,
    Color onError,
  }) {
    final defaultTextTheme = brightness == Brightness.light
        ? Typography.material2014(platform: defaultTargetPlatform).black
        : Typography.material2014(platform: defaultTargetPlatform).white;

    final theme = ThemeData.from(
      colorScheme: ColorScheme(
        primary: primary,
        primaryVariant: primary,
        secondary: primary,
        secondaryVariant: primary,
        surface: surface,
        background: background,
        error: error,
        onPrimary: text,
        onSecondary: text,
        onSurface: text,
        onBackground: text,
        onError: onError,
        brightness: brightness,
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
