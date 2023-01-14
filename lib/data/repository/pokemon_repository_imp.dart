import 'package:hivedex/data/models/pokemon.dart';
import 'package:hivedex/data/repository/pokemon_repository.dart';
import 'package:hivedex/data/services/pokemon_service.dart';

class PokemonRepositoryImp extends PokemonRepository {
  final PokemonService pokemonService;

  PokemonRepositoryImp({
    required this.pokemonService,
  });

  @override
  Future<List<Pokemon>> getPokemon(int offset) async {
    try {
      final apiPokemons = await pokemonService.getPokemons(offset);
      List<Pokemon> pokemons = [];
      for (var pokemon in apiPokemons) {
        pokemons.add(pokemon);
      }
      return pokemons;
    } catch (e) {
      throw Exception('Error adding Pokemons to Class in Repository');
    }
  }
}
