import 'package:equatable/equatable.dart';

import 'package:hivedex/data/models/pokemon.dart';

abstract class PokemonsEvent extends Equatable {}

class GetPokemons extends PokemonsEvent {
  @override
  List<Object?> get props => [];
}

class SwitchFavoritePokemon extends PokemonsEvent {
  final Pokemon pokemon;
  SwitchFavoritePokemon(this.pokemon);
  @override
  List<Object?> get props => [pokemon];
}
