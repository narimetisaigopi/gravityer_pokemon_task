import 'package:get/get.dart';
import 'package:gravityer_pokemon_task/controllers/pokemon_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonController>(() => PokemonController());
  }
}
