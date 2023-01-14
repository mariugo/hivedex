import 'package:hive/hive.dart';
import 'package:hivedex/constants/app_constants.dart';
import 'package:hivedex/data/models/pokemon.dart';

class LocalStorage {
  static Box<Pokemon> getPokemonBox() => Hive.box<Pokemon>(favoritePokemon);
}
