import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/features/pokedex/home/container/home_container.dart';
import 'package:pokedex_flutter/features/pokedex/pokedex_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(dio: Dio()),
      ),
    );
  }
}
