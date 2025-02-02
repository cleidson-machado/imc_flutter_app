import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pokemon_service.dart';
import 'package:my_imc_calc_app/pokemon_state.dart';

//AQUI ATUA COMO NUMA CONTROLLER E VAI FICAR COM A REPRESENTAÇÃO DOS ESTADOS E DA AÇÃO.

class PokemonStore extends ChangeNotifier {
  final service = PokemonService();

  PokemonState state = EmptyPokemonState();

  getPokemons() async {
    state = LoadingPokemonState();
    notifyListeners();

    try {
      final pokemons = await service.fetchAll();
      state = GettedPokemonState(pokemons);
      notifyListeners();
    } catch (e) {
      state = ErrorPokemonState(e.toString());
      notifyListeners();
    }
  }
}
