import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pokemon_service.dart';
import 'package:my_imc_calc_app/pokemon_state.dart';

//AQUI ATUA COMO NUMA CONTROLLER E VAI FICAR COM A REPRESENTAÇÃO DOS ESTADOS E DA AÇÃO.

class PokemonStore extends ChangeNotifier {
  
  final service = PokemonService();

  // ###################################### IMPORTANTE AQUI TODOS OS ESTADOS ESTÃO REPRESENTADOS EM UM ÚNICO "ESTADO"...
  var state = PokemonState.empty(); //##### INCIA USANDO O CONSTRUTOR VAZIO...

  getPokemons() async {
    state = state.copyWith(error: '', isLoading: true); // ####################### OS ESTADOS SÃO REPASSADOS COMO PARÂMETROS NOMEADOS AQUI
    notifyListeners();

    try {
      final pokemons = await service.fetchAll();
      state = state.copyWith(isLoading: false, pokemons: pokemons); // ############ OS ESTADOS SÃO REPASSADOS COMO PARÂMETROS NOMEADOS AQUI
      notifyListeners();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString()); // ########## OS ESTADOS SÃO REPASSADOS COMO PARÂMETROS NOMEADOS AQUI
      notifyListeners();
    }
  }

}
