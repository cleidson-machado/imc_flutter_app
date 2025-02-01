import 'package:my_imc_calc_app/pokemon_model_class.dart';

class PokemonService {
  Future<List<PokemonModelClass>> fetchAll() async {

    await Future.delayed(const Duration(seconds: 3));

    return [
      PokemonModelClass(name: 'Picachu'),
      PokemonModelClass(name: 'Mewtwo'),
      PokemonModelClass(name: 'Mew'),
      PokemonModelClass(name: 'Rayquaza'),
      PokemonModelClass(name: 'Lugia'),
      PokemonModelClass(name: 'Giratina'),
      PokemonModelClass(name: 'Kyurem'),
      PokemonModelClass(name: 'Eternatus'),
    ];
  }
}