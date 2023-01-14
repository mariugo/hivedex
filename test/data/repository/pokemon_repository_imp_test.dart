import 'package:flutter_test/flutter_test.dart';
import 'package:hivedex/data/models/pokemon.dart';
import 'package:hivedex/data/repository/pokemon_repository_imp.dart';
import 'package:hivedex/data/services/pokemon_service_imp.dart';

void main() {
  final pokemonRepositoryImp =
      PokemonRepositoryImp(pokemonService: PokemonServiceImp());

  test('Should get a list of Pokemon from the Repository', () async {
    final response = await pokemonRepositoryImp.getPokemon(0);
    expect(response, isA<List<Pokemon>>());
  });
  test('Should get bulbasaur Pokemon from the Repository', () async {
    final response = await pokemonRepositoryImp.getPokemon(0);
    expect(response.first.name, 'bulbasaur');
  });
}
