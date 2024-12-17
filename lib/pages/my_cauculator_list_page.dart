import 'package:flutter/material.dart';

class MyCalculatorListPage extends StatefulWidget {
  const MyCalculatorListPage({super.key, required this.title});
  final String title;

  @override
  State<MyCalculatorListPage> createState() => _MyCalculatorListPageState();
}

class _MyCalculatorListPageState extends State<MyCalculatorListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(widget.title),
      ),
    );
  }
}
