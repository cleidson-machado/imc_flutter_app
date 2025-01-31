import 'package:my_imc_calc_app/pokemon_model_class.dart';

class PokemonService {
  Future<List<PokemonModelClass>> fetchAll() async {
    return [
      PokemonModelClass("Picachu"),
      PokemonModelClass("Mewtwo"),
      PokemonModelClass("Mew"),
      PokemonModelClass("Rayquaza"),
      PokemonModelClass("Lugia"),
      PokemonModelClass("Giratina"),
      PokemonModelClass("Kyurem"),
      PokemonModelClass("Eternatus"),
    ];
  }
}