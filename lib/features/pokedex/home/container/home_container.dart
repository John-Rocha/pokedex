import 'package:flutter/material.dart';

import 'package:pokedex_flutter/common/error/failure.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/common/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/common/widgets/po_error.dart';
import 'package:pokedex_flutter/common/widgets/po_loading.dart';
import 'package:pokedex_flutter/features/pokedex/details/container/details_container.dart';
import 'package:pokedex_flutter/features/pokedex/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);

  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

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
            return HomePage(
              pokemons: snapshot.data!,
              onItemTap: onItemTap,
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
