import 'package:hivedex/data/models/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemon(int offset);
}
