import 'package:my_imc_calc_app/pokemon_model_class.dart';

class PokemonServiceBKP {
  final List<PokemonModelClass> _pokemonList = [
    PokemonModelClass("Picachu"),
    PokemonModelClass("Mewtwo"),
    PokemonModelClass("Mew"),
    PokemonModelClass("Rayquaza"),
    PokemonModelClass("Lugia"),
    PokemonModelClass("Giratina"),
    PokemonModelClass("Kyurem"),
    PokemonModelClass("Eternatus"),
  ];

  Future<List<PokemonModelClass>> fetchAll() async {
    // Simulate a delay (you would replace this with actual API calls)
    await Future.delayed(const Duration(seconds: 1));
    return _pokemonList;
  }

  Future<void> add(PokemonModelClass pokemon) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate delay
    _pokemonList.add(pokemon);
  }

  Future<void> update(int index, PokemonModelClass updatedPokemon) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate delay
    _pokemonList[index] = updatedPokemon;
  }

  Future<void> delete(int index) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate delay
    _pokemonList.removeAt(index);
  }
}
