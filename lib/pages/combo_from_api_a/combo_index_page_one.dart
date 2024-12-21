import 'package:flutter/material.dart';

class ComboIndexPageOne extends StatefulWidget {
  const ComboIndexPageOne({super.key, required this.title});

  final String title;

  @override
  State<ComboIndexPageOne> createState() => _ComboIndexPageOneState();
}

class _ComboIndexPageOneState extends State<ComboIndexPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 2.5,
          title: Text(widget.title),
      ),
      body: const Column(),
    );
  }
}