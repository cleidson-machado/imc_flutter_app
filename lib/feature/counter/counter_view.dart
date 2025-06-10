// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/feature/counter/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  final String title;

  const CounterView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: const Center(
          child: CounterDisplay(),
        ),
        floatingActionButton: const IncrementButton(),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterViewModel>().counter;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('You have pushed the button this many times:'),
        Text('$counter', style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CounterViewModel>();
    return FloatingActionButton(
      onPressed: viewModel.incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
