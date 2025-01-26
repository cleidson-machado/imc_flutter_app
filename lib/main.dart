// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/features/counter_one/counter_view_model.dart';
import 'package:my_imc_calc_app/features/note_rest_try_one/note_view_model.dart';
import 'package:my_imc_calc_app/features/counter_one/counter_view.dart';
import 'package:my_imc_calc_app/features/note_rest_try_one/views/note_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        // create: (context) => CounterViewModel(),
        create: (context) => NoteViewModel(),
        // child: const CounterView(),
         child: const NoteListView(),
      ),
    );
  }
}
