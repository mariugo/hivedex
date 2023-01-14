import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivedex/bloc/pokemons_bloc.dart';
import 'package:hivedex/bloc/pokemons_state.dart';
import 'package:hivedex/constants/app_constants.dart';
import 'package:hivedex/data/models/pokemon.dart';
import 'package:hivedex/data/storage/local_storage.dart';
import 'package:hivedex/presentation/widgets/pokemon_card.dart';

class FavoritePokemons extends StatelessWidget {
  const FavoritePokemons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonsBloc, PokemonsState>(
      builder: (context, state) {
        return ValueListenableBuilder<Box<Pokemon>>(
          valueListenable: LocalStorage.getPokemonBox().listenable(),
          builder: (context, box, _) {
            final pokemons = box.values.toList().cast<Pokemon>();
            if (pokemons.isEmpty) {
              return const Center(
                child: Text(noFavorites),
              );
            }
            return GridView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                return PokemonCard(
                  pokemon: pokemons[index],
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 186,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12),
              padding: const EdgeInsets.all(15),
            );
          },
        );
      },
    );
  }
}
