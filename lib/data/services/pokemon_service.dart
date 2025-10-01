import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'pokemon_service.g.dart';

@riverpod
Future<String> pokemonName(Ref ref) async {
  final String pokemon = await PokemonInformation.getPokemonName(1);
  return pokemon;
}

@Riverpod(keepAlive: true)
Future<String> pokemon(Ref ref, {int id = 1}) async {
  final String pokemon = await PokemonInformation.getPokemonName(id);
  return pokemon;
}
