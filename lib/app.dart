import 'package:clock/clock.dart';
import 'package:fast_shopping/features/items/items_screen.dart';
import 'package:fast_shopping/theme.dart';
import 'package:fast_shopping_bloc/fast_shopping_bloc.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class FastShoppingApp extends StatelessWidget {
  const FastShoppingApp({
    Key key,
    @required this.appSettingsRepository,
    @required this.shoppingListRepository,
  }) : super(key: key);

  final AppSettingsRepository appSettingsRepository;
  final ShoppingListRepository shoppingListRepository;

  @override
  Widget build(BuildContext context) {
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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: FastShoppingTheme.light(),
          home: ItemsScreen(),
          // Localization stuff
          locale: OverrideLocale.of(context),
          onGenerateTitle: (context) => S.of(context).app_title,
          supportedLocales: S.supportedLocales,
          localizationsDelegates: S.localizationsDelegates,
        ),
      ),
    );
  }
}
