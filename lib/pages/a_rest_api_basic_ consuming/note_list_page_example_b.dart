// ignore_for_file: prefer_adjacent_string_concatenation

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NoteListPageExampleB extends StatefulWidget {
  const NoteListPageExampleB({super.key, required this.title});

  final String title;

  @override
  State<NoteListPageExampleB> createState() => _NoteListPageExampleBState();
}

class _NoteListPageExampleBState extends State<NoteListPageExampleB> {
  //### START HERE THE BASIC AND SIMPLE REST API REQUEST ####################
  Future<List> getTheNotes() async {
    var url =
        Uri.parse('https://6767d711c1de2e6421c86392.mockapi.io/api/v1/notes');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Error When Load Data from Rest API EndPoint!');
    }
  }
  //### END HERE THE BASIC AND SIMPLE REST API REQUEST ####################

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
      body: FutureBuilder<List>(
        future: getTheNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      ' Id: ${snapshot.data![index]['noteID']} | ${snapshot.data![index]['noteTitle']}'),
                  subtitle: Text(
                          'Last Created on:: ${snapshot.data![index]['createDateTime']}'
                          '\n' +
                          'Last Edited on:: ${snapshot.data![index]['latestEditDateTime']}'),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
              strokeWidth: 5,
            ),
          );
        },
      ),
    );
  }
}
