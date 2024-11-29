import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravityer_pokemon_task/models/pokemon_model.dart';

class PokemonDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PokemonModel card = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(card.name),
      ),
      body: ListView(
        children: [
          Hero(
            tag: card.id,
            child: Image.network(
              card.images.large,
              height: 200,
              width: 200,
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text("Name"),
            subtitle: Text(card.name),
          ),
          ListTile(
            title: Text("Types"),
            subtitle: Text(card.types.join(", ")),
          ),
          ListTile(
            title: Text("HP"),
            subtitle: Text(card.hp),
          ),
          ListTile(
            title: Text("Artist"),
            subtitle: Text(card.artist),
          ),
          ListTile(
            title: Text("Set"),
            subtitle: Text(card.set.name),
          ),
          ListTile(
            title: Text("Attacks"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: card.attacks.map((attack) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${attack.name}: ${attack.damage} Damage"),
                    Text("Cost: ${attack.cost.join(', ')}"),
                    Text("Text: ${attack.text}"),
                    SizedBox(height: 5),
                  ],
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text("Weaknesses"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: card.weaknesses.map((weakness) {
                return Text("${weakness.type}: ${weakness.value}");
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
