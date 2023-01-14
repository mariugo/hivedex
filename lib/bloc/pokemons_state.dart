// ignore_for_file: overridden_fields, annotate_overrides

import 'package:equatable/equatable.dart';

import 'package:hivedex/data/models/pokemon.dart';

class PokemonState extends Equatable {
  final List<Pokemon> pokemons;
  final List<Pokemon> favoritePokemons;

  const PokemonState({
    this.pokemons = const [],
    this.favoritePokemons = const [],
  });

  @override
  List<Object?> get props => [pokemons];
}

class PokemonLoaded extends PokemonState {
  final List<Pokemon> pokemons;

  final Pokemon? loadedPokemon;

  const PokemonLoaded({
    required this.pokemons,
    this.loadedPokemon,
  });
}

class PokemonLoading extends PokemonState {
  final List<Pokemon> pokemons;
  final bool isFirstFetched;

  const PokemonLoading({
    required this.pokemons,
    this.isFirstFetched = false,
  });
}
