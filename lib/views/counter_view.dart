import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/viewmodel/counter_view_moel.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterViewMoel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App With MVVM'),
      ),
      body: Center(
        child: Text('Counter: ${viewModel.counter}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
