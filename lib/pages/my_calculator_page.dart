import 'package:flutter/material.dart';

class MyCalculatorPage extends StatefulWidget {
  const MyCalculatorPage({super.key, required this.title});
  final String title;

  @override
  State<MyCalculatorPage> createState() => _MyCalculatorPageState();
}

class _MyCalculatorPageState extends State<MyCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 2.5,
          title: Text(widget.title),
        ),
        body: const Text('The Body'));
  }
}
