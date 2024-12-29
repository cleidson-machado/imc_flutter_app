import 'package:flutter/material.dart';

class NoteListPageExampleC extends StatefulWidget {
  const NoteListPageExampleC({super.key, required this.title});

  final String title;

  @override
  State<NoteListPageExampleC> createState() => _NoteListPageExampleCState();
}

class _NoteListPageExampleCState extends State<NoteListPageExampleC> {

  //### START HERE THE BASIC AND SIMPLE REST API REQUEST USING DIO ####################

  //### END HERE THE BASIC AND SIMPLE REST API REQUEST USING DIO ####################

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('API Request Using Dio'),
      ),
    );
  }
}
