import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivedex/bloc/pokemons_bloc.dart';
import 'package:hivedex/bloc/pokemons_event.dart';
import 'package:hivedex/constants/app_constants.dart';
import 'package:hivedex/data/models/pokemon.dart';
import 'package:hivedex/data/storage/local_storage.dart';
import 'package:hivedex/presentation/widgets/favorite_pokemons.dart';
import 'package:hivedex/presentation/widgets/pokemon_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    BlocProvider.of<PokemonsBloc>(context).add(GetPokemons());
  }

  @override
  void dispose() {
    Hive.box(favoritePokemon).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Image(
              image: AssetImage(icon),
              height: 24,
              width: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              tabs: [
                const Tab(
                  text: pokemons,
                ),
                Tab(
                  //text: 'Favourites',
                  child: Row(
                    children: [
                      const Text(favorites),
                      const SizedBox(
                        width: 4,
                      ),
                      ValueListenableBuilder<Box<Pokemon>>(
                        valueListenable:
                            LocalStorage.getPokemonBox().listenable(),
                        builder: (context, box, _) {
                          final pokemons = box.values.toList().cast<Pokemon>();
                          return Container(
                            decoration: BoxDecoration(
                                color: const Color(0XFF3558CD),
                                borderRadius: BorderRadius.circular(15)),
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            child: Text(
                              pokemons.length.toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  AllPokemons(),
                  const FavoritePokemons(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
