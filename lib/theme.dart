import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FastShoppingTheme {
  static ThemeData light() {
    return _build(
      brightness: Brightness.light,
      primary: const Color(0xFFFFC107),
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
      text: Colors.white,
      surface: const Color(0xFF222222),
      background: const Color(0xFF121212),
      error: const Color(0xFFEA9A9A),
      onError: Colors.black,
    );
  }

  static ThemeData _build({
    required Brightness brightness,
    required Color primary,
    required Color text,
    required Color surface,
    required Color background,
    required Color error,
    required Color onError,
  }) {
    final isDark = brightness == Brightness.dark;
    final defaultTextTheme = isDark
        ? Typography.material2014(platform: defaultTargetPlatform).white
        : Typography.material2014(platform: defaultTargetPlatform).black;

    final darkPrimary = Color.lerp(primary, surface, 0.8)!;

    final theme = ThemeData.from(
      colorScheme: ColorScheme(
        primary: primary,
        primaryVariant: isDark ? darkPrimary : primary,
        secondary: isDark ? darkPrimary : primary,
        secondaryVariant: isDark ? darkPrimary : primary,
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
        bodyText2: defaultTextTheme.bodyText2!.copyWith(
          fontSize: 16,
        ),
      ),
    );

    final buttonColor = isDark ? text : Color.lerp(primary, text, 0.8);

    return theme.copyWith(
      bottomAppBarColor: isDark ? surface : primary,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

extension TextButtonStyles on TextButton {
  Widget get primary {
    return Builder(
      builder: (context) {
        final primary = Theme.of(context).colorScheme.primary;
        final surface = Theme.of(context).colorScheme.surface;
        final onSurface = Theme.of(context).colorScheme.onSurface;

        final text = Color.lerp(primary, onSurface, 0.75);
        final background = Color.lerp(primary, surface, 0.75);

        return TextButton(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: TextButton.styleFrom(
            primary: text,
            backgroundColor: background,
          ).merge(style),
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: child!,
        );
      },
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
        child: child!,
      ),
    );
  }
}
