import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravityer_pokemon_task/controllers/pokemon_controller.dart';
import 'package:gravityer_pokemon_task/models/pokemon_model.dart';
import 'package:gravityer_pokemon_task/widgets/pokemon_widget.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final PokemonController controller = Get.find<PokemonController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.fetchCards(page: controller.currentPage + 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon list"),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.pokemonModelList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification &&
                _scrollController.position.pixels ==
                    _scrollController.position.maxScrollExtent) {
              controller.fetchCards(page: controller.currentPage + 1);
            }
            return true;
          },
          child: GridView.builder(
            controller:
                _scrollController, // Set the controller for infinite scrolling

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2),
            itemCount: controller.pokemonModelList.length +
                (controller.isLoading.value
                    ? 1
                    : 0), // Add one more for the loading indicator

            itemBuilder: (context, index) {
              if (index < controller.pokemonModelList.length) {
                PokemonModel pokemonModel = controller.pokemonModelList[index];
                return PokemonWidget(pokemonModel: pokemonModel);
              } else {
                // Show loading spinner at the end
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      }),
    );
  }
}
