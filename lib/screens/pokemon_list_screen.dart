import 'dart:async';

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
  final TextEditingController _searchController = TextEditingController();

  String searchQuery = "";
  bool isSearching = false;
  Timer? _debounce;

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
        backgroundColor: Colors.teal,
        title: isSearching
            ? Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: "Search Pokemon by set name...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: const TextStyle(color: Colors.white),
                      onChanged: onSearchChanged,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.white),
                    onPressed: clearSearch,
                  ),
                ],
              )
            : const Text(
                "Pokemon List",
                style: TextStyle(color: Colors.white),
              ),
        actions: [
          if (!isSearching)
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                setState(() {
                  isSearching = true;
                });
              },
            ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.pokemonModelList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.pokemonModelList.isEmpty) {
          return const Center(
            child: Text(
              "No Pokemon found. Try a different search.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification &&
                _scrollController.position.pixels ==
                    _scrollController.position.maxScrollExtent) {
              if (searchQuery.isEmpty) {
                controller.fetchCards(page: controller.currentPage + 1);
              }
            }
            return true;
          },
          child: GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.95),
            itemCount: controller.pokemonModelList.length +
                (controller.isLoading.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < controller.pokemonModelList.length) {
                PokemonModel pokemonModel = controller.pokemonModelList[index];
                return PokemonWidget(pokemonModel: pokemonModel);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      }),
    );
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchQuery = query;
      if (query.isEmpty) {
        controller.fetchCards();
      } else {
        controller.fetchSearchResults(query);
      }
    });
  }

  void clearSearch() {
    _searchController.clear();
    onSearchChanged("");
    setState(() {
      isSearching = false;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
