import 'package:flutter/material.dart';

class NoteListPageExampleB extends StatefulWidget {
  const NoteListPageExampleB({super.key, required this.title});

  final String title;

  @override
  State<NoteListPageExampleB> createState() => _NoteListPageExampleBState();
}

class _NoteListPageExampleBState extends State<NoteListPageExampleB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Home Test List Page B'),
      ),
    );
  }
}