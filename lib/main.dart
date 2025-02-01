// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pokemon_store.dart';

//BASE!!! ### ESSA É A OPÇÃO MAIS BÁSICA DE ASSINAR A VIEW / WIDGET PARA ESCUTAR AS MODIFICAÇÕES DE ESTADO  ###

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final storeController = PokemonStore(); //####### DECLARA AQUI!!!

  @override
  void initState() {
    super.initState();
    storeController.addListener(() { //### CONSOME OU INICA AQUI!!!
      setState(() {}); //################# CONSOME OU INICA AQUI!!!
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget innerBody = Container();

    if (storeController.isLoading) {
      innerBody = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (storeController.error.isNotEmpty) {
      innerBody = Center(
          child: ElevatedButton(onPressed: storeController.getPokemons, child: Text(storeController.error)));
    } else if (storeController.pokemonsx.isEmpty) {
      innerBody = Center(
          child: ElevatedButton(
              onPressed: storeController.getPokemons, child: const Text('Toque Aqui')));
    } else {
      innerBody = ListView.builder(
        itemCount: storeController.pokemonsx.length,
        itemBuilder: (context, index) {
          final pokemon = storeController.pokemonsx[index];
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
  }
}
