import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/viewmodel/counter_view_moel.dart';
import 'package:my_imc_calc_app/views/counter_view.dart';
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
        create: (context) => CounterViewMoel(),
        child: const CounterView(),
      ),
    );
  }
}
