import 'dart:convert';

import 'package:hivedex/constants/app_constants.dart';
import 'package:hivedex/data/models/pokemon.dart';
import 'package:hivedex/data/services/pokemon_service.dart';
import 'package:http/http.dart' as http;

class PokemonServiceImp extends PokemonService {
  static const limit = 21;

  @override
  Future<List<Pokemon>> getPokemons(int offset) async {
    //print('this is get services');
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}offset=$offset&limit=$limit'));
      //print('getting');
      final pokemonsResponse = jsonDecode(response.body) as Map;
      final pokemonsResults = pokemonsResponse['results'] as List;

      // pokemonsResults.forEach((poke) {
      // });
      final List<Pokemon> pokemons = [];

      for (var pokemon in pokemonsResults) {
        String pokemonsUrl = pokemon['url'];
        try {
          http.Response httpResponse = await http.get(Uri.parse(pokemonsUrl));
          final responseBody = await jsonDecode(httpResponse.body);

          Pokemon pokemonDetails = Pokemon(
            imageUrl: responseBody['sprites']['other']['official-artwork']
                ['front_default'],
            number: responseBody['id'].toString(),
            name: responseBody['name'],
            category: responseBody['types'][0]['type']['name'],
            height: responseBody['height'],
            attack: responseBody['stats'][1]['base_stat'],
            defense: responseBody['stats'][2]['base_stat'],
            hp: responseBody['stats'][0]['base_stat'],
            specialAttack: responseBody['stats'][3]['base_stat'],
            specialDefense: responseBody['stats'][4]['base_stat'],
            weight: responseBody['weight'],
            speed: responseBody['stats'][5]['base_stat'],
            normalAbility: responseBody['abilities'][0]['ability']['name'],
            type: responseBody['types'][0]['type']['name'],
          );

          pokemons.add(pokemonDetails);
        } catch (e) {
          throw Exception(
              'Error decoding and converting http response to Pokemon Class');
        }
      }
      return pokemons;
    } catch (e) {
      throw Exception('Error getting pokemons from server');
    }
  }
}
