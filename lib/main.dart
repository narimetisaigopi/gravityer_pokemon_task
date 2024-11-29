import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravityer_pokemon_task/screens/pokemon_details_screen.dart';
import 'package:gravityer_pokemon_task/screens/pokemon_list_screen.dart';
import 'bindings/home_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Pokemon App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          binding: HomeBinding(),
          page: () => const PokemonListScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: "/details",
          page: () => const PokemonDetailsScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
