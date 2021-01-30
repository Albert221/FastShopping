import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:flutter/widgets.dart';

extension DarkModeLocalize on DarkMode {
  String localize(BuildContext context) {
    switch (this) {
      case DarkMode.system:
        return S.of(context).settings_dark_mode_system;
      case DarkMode.disabled:
        return S.of(context).settings_dark_mode_disabled;
      case DarkMode.enabled:
        return S.of(context).settings_dark_mode_enabled;
      default:
        return null;
    }
  }
}

extension ItemsLayoutLocalize on ItemsLayout {
  String localize(BuildContext context) {
    switch (this) {
      case ItemsLayout.comfortable:
        return S.of(context).settings_items_layout_comfortable;
      case ItemsLayout.dense:
        return S.of(context).settings_items_layout_dense;
      default:
        return null;
    }
  }
}
