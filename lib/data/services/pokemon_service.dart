import 'package:hivedex/data/models/pokemon.dart';

abstract class PokemonService {
  Future<List<Pokemon>> getPokemons(int offset);
}
