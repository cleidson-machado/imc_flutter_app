import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pokemon_model_class.dart';
import 'package:my_imc_calc_app/pokemon_service.dart';

//AQUI ATUA COMO NUMA CONTROLLER E VAI FICAR COM A REPRESENTAÇÃO DOS ESTADOS E DA AÇÃO.

class PokemonStore extends ChangeNotifier {
  
  final service = PokemonService();

  var isLoading = false; // ####################################### Esse cara representa o primeiro estagio do gerenciamento de estadpo
  var error =''; // ############################################### Esse cara representa o primeiro estagio do gerenciamento de estadpo
  var pokemonsx =<PokemonModelClass>[]; // ######################## Esse cara representa o primeiro estagio do gerenciamento de estadpo

  getPokemons() async {
    isLoading = true;
    error = '';
    notifyListeners();

    try {
      final pokemonsx = await service.fetchAll();
      this.pokemonsx = pokemonsx;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  

}
