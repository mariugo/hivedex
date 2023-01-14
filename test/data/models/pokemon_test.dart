import 'package:flutter_test/flutter_test.dart';
import 'package:hivedex/data/models/pokemon.dart';

void main() {
  final pokemon = Pokemon(
    speed: 10,
    imageUrl: 'www.google.com',
    number: '1',
    name: 'bulbasaur',
    category: 'bulbasaur',
    height: 30,
    attack: 30,
    defense: 30,
    hp: 60,
    specialAttack: 30,
    specialDefense: 30,
    weight: 100,
    isFavorite: true,
  );

  group('Unit test for Pokemon Model Class', () {
    test('Should return instance of Pokemon', () {
      expect(pokemon, isA<Pokemon>());
    });
    test('Should return ' 'bulbasaur' ' name', () {
      expect(pokemon.name, 'bulbasaur');
    });
    test('Should return ' 'www.google.com' ' imageUrl', () {
      expect(pokemon.imageUrl, 'www.google.com');
    });
    test('Should return as favorite', () {
      expect(pokemon.isFavorite, true);
    });
    test('Should return hp as 60', () {
      expect(pokemon.hp, 60);
    });
  });
}
