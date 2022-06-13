import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_flutter/common/consts/api_consts.dart';
import 'package:pokedex_flutter/common/error/failure.dart';

import 'package:pokedex_flutter/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({
    required this.dio,
  });

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsUrl);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final pokemonList = json['pokemon'] as List<dynamic>;
      return pokemonList.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os dados!');
    }
  }
}
