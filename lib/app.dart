import 'package:clock/clock.dart';
import 'package:fast_shopping/features/items/items_screen.dart';
import 'package:fast_shopping/theme.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uuid/uuid.dart';

class FastShoppingApp extends HookWidget {
  const FastShoppingApp({
    Key key,
    @required this.appSettingsRepository,
    @required this.shoppingListRepository,
  }) : super(key: key);

  final AppSettingsRepository appSettingsRepository;
  final ShoppingListRepository shoppingListRepository;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      setupTimeagoMessages();
      return;
    }, const []);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Clock>.value(value: const Clock()),
        RepositoryProvider<Uuid>.value(value: Uuid()),
        RepositoryProvider<AppSettingsRepository>.value(
          value: appSettingsRepository,
        ),
        RepositoryProvider<ShoppingListRepository>.value(
          value: shoppingListRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppSettingsCubit(
              context.read<AppSettingsRepository>(),
            )..load(),
          ),
          BlocProvider(
            create: (context) => ShoppingListsCubit(
              context.read<ShoppingListRepository>(),
              context.read<Clock>(),
              context.read<Uuid>(),
            )..load(),
          ),
          BlocProvider(
            create: (context) => SelectedShoppingListCubit(
              context.read<ShoppingListsCubit>(),
              context.read<Clock>(),
              context.read<Uuid>(),
            ),
          ),
        ],
        child: const _App(),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select<AppSettingsCubit, ThemeData>(
      (AppSettingsCubit c) {
        switch (c.state.darkMode) {
          case DarkMode.disabled:
            return FastShoppingTheme.light();
          case DarkMode.enabled:
            return FastShoppingTheme.dark();
          case DarkMode.system:
          default:
            return MediaQuery.platformBrightnessOf(context) == Brightness.light
                ? FastShoppingTheme.light()
                : FastShoppingTheme.dark();
        }
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: ItemsScreen(),
      // Localization stuff
      locale: OverrideLocale.of(context),
      onGenerateTitle: (context) => S.of(context).app_title,
      supportedLocales: S.supportedLocales,
      localizationsDelegates: S.localizationsDelegates,
    );
  }
}
