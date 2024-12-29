import 'package:flutter/material.dart';

class TabPageExampleA extends StatefulWidget {
  const TabPageExampleA({super.key, required this.title});

  final String title;

  @override
  State<TabPageExampleA> createState() => _TabPageExampleAState();
}

class _TabPageExampleAState extends State<TabPageExampleA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(widget.title),
        centerTitle: true,
      ),
    );
  }
}