import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/data_structures_001/fruits_list.dart';

class ListExample extends StatelessWidget {
  const ListExample({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("List Example")),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fruits[index]),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: ListExample()));
}
