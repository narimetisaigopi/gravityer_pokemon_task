import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravityer_pokemon_task/models/pokemon_model.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonModel card = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(card.name),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: card.id,
                child: CachedNetworkImage(
                  imageUrl: card.images.large,
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle("Basic Details"),
            _buildDetailRow("Name", card.name),
            _buildDetailRow("Types", card.types.join(", ")),
            _buildDetailRow("HP", card.hp),
            _buildDetailRow("Artist", card.artist),
            _buildDetailRow("Set", card.set.name),
            const Divider(),
            _buildSectionTitle("Attacks"),
            ...card.attacks.map((attack) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ${attack.name} (${attack.damage} Damage)",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Cost: ${attack.cost.join(', ')}",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      "Description: ${attack.text}",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              );
            }),
            const Divider(),
            _buildSectionTitle("Weaknesses"),
            ...card.weaknesses.map((weakness) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "• ${weakness.type}: ${weakness.value}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              );
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
