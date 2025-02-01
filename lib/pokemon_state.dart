// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_imc_calc_app/pokemon_model_class.dart';

class PokemonState {

  final bool isLoading; 
  final String error;
  final List<PokemonModelClass> pokemons;

  PokemonState({
    required this.isLoading,
    required this.error,
    required this.pokemons,
  });

  factory PokemonState.empty(){
    return PokemonState(isLoading: false, error: '', pokemons: []);
  }


  PokemonState copyWith({
    bool? isLoading,
    String? error,
    List<PokemonModelClass>? pokemons,
  }) {
    return PokemonState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      pokemons: pokemons ?? this.pokemons,
    );
  }
}
