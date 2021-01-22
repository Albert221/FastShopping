import 'package:clock/clock.dart';
import 'package:fast_shopping/features/items/items_screen.dart';
import 'package:fast_shopping/l10n/override_locale.dart';
import 'package:fast_shopping/theme.dart';
import 'package:fast_shopping_bloc/data.dart';
import 'package:fast_shopping_bloc/selected_shopping_list.dart';
import 'package:fast_shopping_bloc/shopping_lists.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class FastShoppingApp extends StatelessWidget {
  const FastShoppingApp({Key key, @required this.shoppingListRepository})
      : super(key: key);

  final ShoppingListRepository shoppingListRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Clock>.value(value: const Clock()),
        RepositoryProvider<Uuid>.value(value: Uuid()),
        RepositoryProvider<ShoppingListRepository>.value(
          value: shoppingListRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
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
