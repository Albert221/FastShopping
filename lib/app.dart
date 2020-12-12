import 'package:clock/clock.dart';
import 'package:fast_shopping/features/items/items_screen.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/l10n/sort_locales.dart';
import 'package:fast_shopping/theme.dart';
import 'package:fast_shopping_bloc/data.dart';
import 'package:fast_shopping_bloc/selected_shopping_list.dart';
import 'package:fast_shopping_bloc/shopping_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
          onGenerateTitle: (context) => S.of(context).app_title,
          supportedLocales: S.delegate.supportedLocales.sortLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
