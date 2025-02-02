// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pokemon_state.dart';
import 'package:my_imc_calc_app/pokemon_store.dart';

// BASE!!! ### ESSA É A OPÇÃO MAIS AVANÇADA DO GERENCIAMENTO DE ESTADO  ### 
// MAS É POSSÍVEL AMPLIAR AS COISAS USANDO O STATE PATTER COM O POLIMORFIRMO.. ###
// #### USANDO O POLIMORFISMO ####
// #### USANDO O POLIMORFISMO ####
// #### USANDO O POLIMORFISMO ####
// #### USANDO O POLIMORFISMO ####

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key}); 

  final storeController = PokemonStore(); //########## DECLARA AQUI!!!
 
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder( //###################### E FAZ O USO AQUI!!!
        listenable: storeController, //############### E FAZ O USO AQUI!!!
        builder: (context, child) {
          
          Widget innerBody = Container();

          final state = storeController.state; //##### INCIA USANDO O CONSTRUTOR VAZIO...

          if (state is LoadingPokemonState) {
            innerBody = const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorPokemonState) {
            innerBody = Center(
                child: ElevatedButton(
                    onPressed: storeController.getPokemons,
                    child: Text(state.message)));
          } else if (state is EmptyPokemonState) {
            innerBody = Center(
                child: ElevatedButton(
                    onPressed: storeController.getPokemons,
                    child: const Text('Toque Aqui')));
          } else if(state is GettedPokemonState) {
            innerBody = ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = state.pokemons[index];
                return ListTile(
                  title: Text(pokemon.name),
                );
              },
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Pokemon'),
            ),
            body: innerBody,
          );
        });
  }
}
