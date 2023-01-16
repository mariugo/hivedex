import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivedex/bloc/pokemons_event.dart';
import 'package:hivedex/bloc/pokemons_state.dart';
import 'package:hivedex/data/models/pokemon.dart';
import 'package:hivedex/data/repository/pokemon_repository.dart';
import 'package:hivedex/data/storage/local_storage.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final PokemonRepository pokemonRepository;
  int offset = 0;

  PokemonsBloc(this.pokemonRepository) : super(PokemonsState()) {
    on<GetPokemons>(_getAllPokemons);
    on<SwitchFavoritePokemon>(_switchFavorite);
  }

  void _getAllPokemons(GetPokemons event, Emitter<PokemonsState> emit) async {
    final currentState = state;

    if (state is PokemonLoading) return;

    List<Pokemon> oldPokemons = [];
    if (currentState is PokemonLoaded) {
      oldPokemons = currentState.pokemons;
    }
    emit(
      PokemonLoading(
        pokemons: oldPokemons,
        isFirstFetch: offset == 0,
      ),
    );

    await pokemonRepository.getPokemon(offset).then((newPokemons) {
      offset = offset + 21;
      final pokemons = (state as PokemonLoading).pokemons;
      pokemons.addAll(newPokemons);
      emit(
        PokemonLoaded(
          pokemons: pokemons,
        ),
      );
    });
  }

  void _switchFavorite(
      SwitchFavoritePokemon event, Emitter<PokemonsState> emit) async {
    final box = LocalStorage.getPokemonBox();

    if (!event.pokemon.isFavorite) {
      event.pokemon.isFavorite = true;
      event.pokemon.id = int.parse(event.pokemon.number);
      await box.put(event.pokemon.id, event.pokemon);
    } else if (event.pokemon.isFavorite) {
      event.pokemon.isFavorite = false;
      await box.delete(event.pokemon.id);
    }
  }
}
