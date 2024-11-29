import 'package:get/get.dart';
import 'package:gravityer_pokemon_task/models/pokemon_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/network_constants.dart';

class PokemonController extends GetxController {
  var isLoading = false.obs;
  var cards = [].obs;
  var currentPage = 1;
  final pageSize = 10;

  var pokemonModelList = <PokemonModel>[].obs;

  @override
  void onInit() {
    fetchCards();
    super.onInit();
  }

  void fetchCards({int page = 1, int pageSize = 10}) async {
    if (isLoading.value) return;

    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          '${NetworkConstants.baseUrl}?page=$page&pageSize=$pageSize'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var data2 = (data['data'] as List)
            .map((e) => PokemonModel.fromJson(e))
            .toList();
        if (page == 1) {
          pokemonModelList(data2);
        } else {
          pokemonModelList.addAll(data2);
        }
        currentPage = page;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
