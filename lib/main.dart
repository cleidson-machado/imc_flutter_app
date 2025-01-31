import 'package:flutter/material.dart';
import 'pokemon_service.dart';

class HomePage extends StatelessWidget {
  // StatelessWidget now
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonService service = PokemonService();
    final pokemonList = service.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon List"),
      ),
      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          return ListTile(
            title: Text(pokemon.name.toString()),
          );
        },
      ),
    );
  }
}
