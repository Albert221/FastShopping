import 'package:clock/clock.dart';
import 'package:fast_shopping/data/shopping_list_repository.dart';
import 'package:fast_shopping/features/items/items_screen.dart';
import 'package:fast_shopping/l10n/l10n.dart';
import 'package:fast_shopping/l10n/sort_locales.dart';
import 'package:fast_shopping/theme.dart';
import 'package:fast_shopping_bloc/data.dart' as data;
import 'package:fast_shopping_bloc/selected_shopping_list.dart';
import 'package:fast_shopping_bloc/shopping_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FastShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<data.ShoppingListRepository>.value(
          value: ShoppingListRepository(),
        ),
        RepositoryProvider<Clock>.value(value: const Clock()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ShoppingListsCubit(
              context.read<data.ShoppingListRepository>(),
              context.read<Clock>(),
            )..load(),
          ),
          BlocProvider(
            create: (context) => SelectedShoppingListCubit(
              context.read<ShoppingListsCubit>(),
              context.read<Clock>(),
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
