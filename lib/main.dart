// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pokemon_model_class.dart';
import 'pokemon_service.dart';

//BASE!!! ### CÓDIGO PARA COMEÇAR A ENTENDER O GRENCIAMENTO DE ESTADO!  ###

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
  late Future<List<PokemonModelClass>> futurePokemonList;
  final service = PokemonService();

  var isLoading = false;
  var error = '';
  var pokemonsx = <PokemonModelClass>[];

  getPokemons() async {
    setState(() {
      isLoading = true;
      error = '';
    });

    try {
      final pokemonsx = await service.fetchAll();
      setState(() {
        this.pokemonsx = pokemonsx;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    futurePokemonList = service.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    Widget innerBody = Container();

    if (isLoading) {
      innerBody = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (error.isNotEmpty) {
      innerBody = Center(
          child: ElevatedButton(onPressed: getPokemons, child: Text(error)));
    } else if (pokemonsx.isEmpty) {
      innerBody = Center(
          child: ElevatedButton(
              onPressed: getPokemons, child: const Text('Toque Aqui')));
    } else {
      innerBody = ListView.builder(
        itemCount: pokemonsx.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonsx[index];
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
