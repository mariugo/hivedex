import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivedex/bloc/pokemons_bloc.dart';
import 'package:hivedex/bloc/pokemons_event.dart';
import 'package:hivedex/bloc/pokemons_state.dart';
import 'package:hivedex/constants/app_constants.dart';
import 'package:hivedex/presentation/widgets/custom_progress_indicator.dart';
import 'package:hivedex/presentation/widgets/pokemon_card.dart';

class AllPokemons extends StatelessWidget {
  AllPokemons({Key? key}) : super(key: key);

  final scrollController = ScrollController();

  void setupScrollControl(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PokemonsBloc>(context).add(GetPokemons());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollControl(context);
    return BlocBuilder<PokemonsBloc, PokemonsState>(
      builder: (context, state) {
        if (state is PokemonLoading && state.isFirstFetch == true) {
          return const Center(child: CustomProgress());
        }
        List pokemons = [];
        bool loading = false;
        if (state is PokemonLoading) {
          loading = true;
          pokemons = state.pokemons;
        } else if (state is PokemonLoaded) {
          pokemons = state.pokemons;
        }
        if (pokemons.isEmpty) {
          return const Center(
            child: Text(noFavorites),
          );
        }
        return GridView.builder(
          controller: scrollController,
          itemCount: pokemons.length + (loading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < pokemons.length) {
              return PokemonCard(
                pokemon: state.pokemons[index],
              );
            } else {
              Timer(const Duration(milliseconds: 300), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });
              return const CustomProgress();
            }
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
  }
}
