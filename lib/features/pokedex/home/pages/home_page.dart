import 'package:flutter/material.dart';

import 'package:pokedex_flutter/common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              pokemons[index].name,
            ),
          );
        },
      ),
    );
  }
}
