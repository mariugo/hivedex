import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivedex/bloc/pokemons_bloc.dart';
import 'package:hivedex/bloc/pokemons_event.dart';
import 'package:hivedex/bloc/pokemons_state.dart';
import 'package:hivedex/constants/app_constants.dart';
import 'package:hivedex/data/models/pokemon.dart';
import 'package:hivedex/data/storage/local_storage.dart';
import 'package:hivedex/utils/app_utils.dart';

class PokemonDetail extends StatefulWidget {
  static const String id = 'pokemonDetail';

  const PokemonDetail({super.key});

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    final box = LocalStorage.getPokemonBox();
    final deviceSize = MediaQuery.of(context).size;
    final loadedPokemon =
        ModalRoute.of(context)!.settings.arguments as Map<String, Pokemon>;

    return Scaffold(
      appBar: AppBar(
          backgroundColor:
              AppUtils.getColorType(loadedPokemon['pokemon']!.type),
          leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back_ios_outlined)),
          iconTheme: const IconThemeData(
            color: Colors.black,
          )),
      body: BlocBuilder<PokemonsBloc, PokemonsState>(
        builder: (context, state) {
          if (state is PokemonLoaded) {
            final pokemon = box.get(loadedPokemon['pokemon']!.id) ??
                state.pokemons.firstWhere((pokemon) =>
                    pokemon.number == loadedPokemon['pokemon']!.number);

            return Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: AppUtils.getColorType(pokemon.type)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 23,
                        left: 16,
                        child: Text(
                          pokemon.name.capitalizeFirst(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Positioned(
                        top: 67,
                        left: 16,
                        child: Text(
                          pokemon.category.capitalizeFirst(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Positioned(
                        bottom: 14,
                        left: 16,
                        child: Text(
                          pokemon.number.length > 1
                              ? '#0${pokemon.number}'
                              : pokemon.number.length > 2
                                  ? '#${pokemon.number}'
                                  : '#00${pokemon.number}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      const Positioned(
                        bottom: -10,
                        right: -23,
                        child: Image(
                          image: AssetImage('assets/images/pokeball.png'),
                          height: 176,
                          width: 176,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 16,
                        child: Image(
                          image: NetworkImage(pokemon.imageUrl),
                          height: 125,
                          width: 136,
                        ),
                      ),
                    ],
                  ),
                ),
                MassIndex(pokemon: pokemon),
                const SizedBox(
                  height: 8,
                ),
                BaseStats(pokemon: pokemon, deviceSize: deviceSize)
              ],
            );
          }
          return const Center(
            child: Text(unable),
          );
        },
      ),
      floatingActionButton:
          BlocBuilder<PokemonsBloc, PokemonsState>(builder: (context, state) {
        final box = LocalStorage.getPokemonBox();
        Pokemon? pokemon;
        if (state is PokemonLoaded) {
          pokemon = box.get(loadedPokemon['pokemon']!.id) ??
              state.pokemons.firstWhere((pokemon) =>
                  pokemon.number == loadedPokemon['pokemon']!.number);
        }
        return FloatingActionButton(
          onPressed: () {
            setState(() {
              BlocProvider.of<PokemonsBloc>(context)
                  .add(SwitchFavoritePokemon(pokemon!));
            });
          },
          backgroundColor: pokemon!.isFavorite ? Colors.pink[200] : Colors.pink,
          child: pokemon.isFavorite
              ? const Icon(Icons.heart_broken_outlined)
              : const Icon(Icons.favorite),
        );
      }),
    );
  }
}

class BaseStats extends StatelessWidget {
  const BaseStats({
    Key? key,
    required this.pokemon,
    required this.deviceSize,
  }) : super(key: key);

  final Pokemon pokemon;
  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 46,
                child: Text(
                  baseStats,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Divider(
                color: Theme.of(context).indicatorColor,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$hp ${pokemon.hp}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: ((pokemon.hp / 100) * deviceSize.width),
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: pokemon.hp >= 50
                                  ? Colors.green
                                  : pokemon.hp >= 45
                                      ? Colors.yellow
                                      : pokemon.hp >= 31
                                          ? Colors.orange
                                          : Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      '$attack ${pokemon.attack}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: ((pokemon.attack / 100) * deviceSize.width),
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: pokemon.attack >= 50
                                  ? Colors.green
                                  : pokemon.attack >= 45
                                      ? Colors.yellow
                                      : pokemon.attack >= 31
                                          ? Colors.orange
                                          : Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      '$defense ${pokemon.defense}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: ((pokemon.defense / 100) * deviceSize.width),
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: pokemon.defense >= 50
                                  ? Colors.green
                                  : pokemon.defense >= 45
                                      ? Colors.yellow
                                      : pokemon.defense >= 31
                                          ? Colors.orange
                                          : Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      '$specialAttack ${pokemon.specialAttack}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: ((pokemon.specialAttack / 100) *
                                deviceSize.width),
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: pokemon.specialAttack >= 50
                                  ? Colors.green
                                  : pokemon.specialAttack >= 45
                                      ? Colors.yellow
                                      : pokemon.specialAttack >= 31
                                          ? Colors.orange
                                          : Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      '$specialDefense ${pokemon.specialDefense}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: ((pokemon.specialDefense / 100) *
                                deviceSize.width),
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: pokemon.specialDefense >= 50
                                  ? Colors.green
                                  : pokemon.specialDefense >= 45
                                      ? Colors.yellow
                                      : pokemon.specialDefense >= 31
                                          ? Colors.orange
                                          : Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      '$speed ${pokemon.speed}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: ((pokemon.speed / 100) * deviceSize.width),
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: pokemon.speed >= 50
                                  ? Colors.green
                                  : pokemon.speed >= 45
                                      ? Colors.yellow
                                      : pokemon.speed >= 31
                                          ? Colors.orange
                                          : Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MassIndex extends StatelessWidget {
  final Pokemon pokemon;

  const MassIndex({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(height),
              Text(
                '${pokemon.height}',
              ),
            ],
          ),
          const SizedBox(
            width: 48,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(weight),
              Text(
                '${pokemon.weight}',
              ),
            ],
          ),
          const SizedBox(
            width: 48,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(normalAbility),
              Text(
                pokemon.normalAbility.capitalizeFirst(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
