import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravityer_pokemon_task/models/pokemon_model.dart';

class PokemonWidget extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokemonWidget({super.key, required this.pokemonModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/details', arguments: pokemonModel);
      },
      child: Hero(
        tag: pokemonModel.id,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl: pokemonModel.images.small,
                    height: 100,
                    width: 100),
                const SizedBox(height: 8),
                Text(pokemonModel.name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
