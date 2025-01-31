import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pokemon_model_class.dart';
import 'package:my_imc_calc_app/pokemon_service_copy.dart';

void main() {
  runApp(const HomePageBkp());
}

class HomePageBkp extends StatefulWidget {
  const HomePageBkp({super.key});

  @override
  State<HomePageBkp> createState() => _HomePageBkpState();
}

class _HomePageBkpState extends State<HomePageBkp> {
  final PokemonServiceBKP _service = PokemonServiceBKP();
  late Future<List<PokemonModelClass>> _pokemonFuture;

  @override
  void initState() {
    super.initState();
    _pokemonFuture = _service.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon CRUD"),
      ),
      body: FutureBuilder<List<PokemonModelClass>>(
        future: _pokemonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final pokemonList = snapshot.data!;
            return ListView.builder(
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonList[index];
                return ListTile(
                  title: Text(pokemon.name.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => _editPokemon(index, pokemon),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => _deletePokemon(index),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPokemon,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addPokemon() async {
    final newPokemonName = await showDialog<String>(
      context: context,
      builder: (context) => _buildAddEditDialog(),
    );

    if (newPokemonName != null) {
      final newPokemon = PokemonModelClass(newPokemonName);
      await _service.add(newPokemon);
      setState(() {
        _pokemonFuture = _service.fetchAll(); // Refresh the list
      });
    }
  }

  void _editPokemon(int index, PokemonModelClass pokemon) async {
    final updatedPokemonName = await showDialog<String>(
      context: context,
      builder: (context) => _buildAddEditDialog(pokemon.name),
    );

    if (updatedPokemonName != null) {
      final updatedPokemon = PokemonModelClass(updatedPokemonName);
      await _service.update(index, updatedPokemon);
      setState(() {
        _pokemonFuture = _service.fetchAll(); // Refresh the list
      });
    }
  }

  void _deletePokemon(int index) async {
    await _service.delete(index);
    setState(() {
      _pokemonFuture = _service.fetchAll(); // Refresh the list
    });
  }

  AlertDialog _buildAddEditDialog([String? initialName]) {
    final controller = TextEditingController(text: initialName);
    return AlertDialog(
      title: Text(initialName == null ? "Add Pokemon" : "Edit Pokemon"),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: "Pokemon Name"),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, controller.text),
          child: const Text("Save"),
        ),
      ],
    );
  }
}
