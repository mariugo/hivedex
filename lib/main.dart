import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivedex/constants/app_constants.dart';
import 'package:hivedex/data/models/pokemon.dart';
import 'package:hivedex/data/repository/pokemon_repository_imp.dart';
import 'package:hivedex/data/services/pokemon_service_imp.dart';
import 'package:hivedex/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonAdapter());
  await Hive.openBox<Pokemon>(favoritePokemon);

  runApp(App(
    pokemonRepositoryImp:
        PokemonRepositoryImp(pokemonService: PokemonServiceImp()),
  ));
}
