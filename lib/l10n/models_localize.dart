import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/widgets.dart';

extension DarkThemeLocalize on DarkTheme {
  String localize(BuildContext context) {
    switch (this) {
      case DarkTheme.system:
        return S.of(context)!.settings_dark_theme_system;
      case DarkTheme.disabled:
        return S.of(context)!.settings_dark_theme_disabled;
      case DarkTheme.enabled:
        return S.of(context)!.settings_dark_theme_enabled;
    }
  }
}
