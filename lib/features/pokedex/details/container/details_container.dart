import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/error/failure.dart';

import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/common/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/common/widgets/po_error.dart';
import 'package:pokedex_flutter/common/widgets/po_loading.dart';
import 'package:pokedex_flutter/features/pokedex/details/pages/details_page.dart';

class DetailArguments {
  DetailArguments({
    required this.name,
  });

  final String name;
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    Key? key,
    required this.repository,
    required this.arguments,
  }) : super(key: key);

  final IPokemonRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PoLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailsPage(
              name: arguments.name,
              pokemons: snapshot.data!,
            );
          }

          if (snapshot.hasError) {
            return PoError(
              error: (snapshot.error as Failure).message!,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
