import 'package:flutter/material.dart';

import 'package:pokedex_flutter/common/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/features/pokedex/details/container/details_container.dart';
import 'package:pokedex_flutter/features/pokedex/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({
    Key? key,
    required this.repository,
  }) : super(key: key);

  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: repository,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(
                    route,
                    arguments: arguments,
                  );
                },
              );
            },
          );
        }
        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailsContainer(
                repository: repository,
                arguments: (settings.arguments) as DetailArguments,
              );
            },
          );
        }
        return null;
      },
    );
  }
}
