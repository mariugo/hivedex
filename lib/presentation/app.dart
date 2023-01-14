import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivedex/bloc/pokemons_bloc.dart';
import 'package:hivedex/constants/app_constants.dart';

import 'package:hivedex/data/repository/pokemon_repository_imp.dart';
import 'package:hivedex/presentation/pages/home_page.dart';
import 'package:hivedex/presentation/theme/app_theme.dart';

class App extends StatelessWidget {
  final PokemonRepositoryImp pokemonRepositoryImp;

  const App({
    Key? key,
    required this.pokemonRepositoryImp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => PokemonsBloc(pokemonRepositoryImp)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        home: const HomePage(),
      ),
    );
  }
}
