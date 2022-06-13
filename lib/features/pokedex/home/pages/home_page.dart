import 'package:flutter/material.dart';

import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/details/container/details_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.pokemons,
    required this.onItemTap,
  }) : super(key: key);

  final List<Pokemon> pokemons;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pokemons[index].name),
            onTap: () => onItemTap(
              '/details',
              DetailArguments(name: pokemons[index].name),
            ),
          );
        },
      ),
    );
  }
}
