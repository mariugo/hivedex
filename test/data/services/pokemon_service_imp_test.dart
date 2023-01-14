import 'package:flutter_test/flutter_test.dart';
import 'package:hivedex/data/models/pokemon.dart';
import 'package:hivedex/data/services/pokemon_service_imp.dart';

void main() {
  final pokemonService = PokemonServiceImp();

  test('Should return a list of Pokemon from API', () async {
    final response = await pokemonService.getPokemons(0);
    expect(response, isA<List<Pokemon>>());
  });
  test('Should return a list of Pokemon from API', () async {
    final response = await pokemonService.getPokemons(0);
    expect(response.first.name, 'bulbasaur');
  });
  test('Should return a overgrow ability', () async {
    final response = await pokemonService.getPokemons(0);
    expect(response.first.normalAbility, 'overgrow');
  });
}
