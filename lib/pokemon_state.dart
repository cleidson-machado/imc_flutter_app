import 'package:my_imc_calc_app/pokemon_model_class.dart';

sealed class PokemonState {}

class EmptyPokemonState implements PokemonState {}

class LoadingPokemonState implements PokemonState {}

class ErrorPokemonState implements PokemonState {
  final String message;

  ErrorPokemonState(this.message);
}

class GettedPokemonState implements PokemonState {
  final List<PokemonModelClass> pokemons;
  GettedPokemonState(this.pokemons);
}
