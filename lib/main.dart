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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
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
          page: () =>
              const PokemonListScreen(), // Replace with your HomePage class
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: "/details",
          page: () =>
              PokemonDetailsScreen(), // Replace with your DetailsPage class
          //transition: Transition.rightToLeft,
          transition: Transition.fade, // Set transition effect here
          transitionDuration:
              const Duration(milliseconds: 500), // Duration for the transition
        ),
      ],
    );
  }
}
