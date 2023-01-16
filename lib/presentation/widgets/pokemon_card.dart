import 'package:flutter/material.dart';

import 'package:hivedex/data/models/pokemon.dart';
import 'package:hivedex/presentation/pages/pokemon_details_page.dart';
import 'package:hivedex/utils/app_utils.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(PokemonDetail.id, arguments: {'pokemon': pokemon});
      },
      child: Container(
        height: 186,
        width: 110,
        decoration: BoxDecoration(
          color: AppUtils.getColorType(pokemon.type),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            Container(
              color: AppUtils.getColorType(pokemon.type),
              height: 104,
              width: 110,
              child: Image(
                image: NetworkImage(
                  pokemon.imageUrl,
                ),
                height: 104,
                width: 104,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    pokemon.number.length > 1
                        ? '#0${pokemon.number}'
                        : pokemon.number.length > 2
                            ? '#${pokemon.number}'
                            : '#00${pokemon.number}',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    pokemon.name.capitalizeFirst(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    pokemon.category.capitalizeFirst(),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
