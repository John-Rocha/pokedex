import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.pokemon,
    required this.pokemons,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: AppBar(
              title: Text(pokemon.name),
              elevation: 0,
              backgroundColor: pokemon.baseColor,
            ),
          ),
        ],
      ),
    );
  }
}
