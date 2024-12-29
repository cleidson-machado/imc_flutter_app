// ignore_for_file: avoid_print, prefer_adjacent_string_concatenation

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

class NoteListPageExampleC extends StatefulWidget {
  const NoteListPageExampleC({super.key, required this.title});

  final String title;

  @override
  State<NoteListPageExampleC> createState() => _NoteListPageExampleCState();
}

class _NoteListPageExampleCState extends State<NoteListPageExampleC> {
  List notes = [];
  bool isLoading = false; // For tracking the loading state

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  //### START HERE THE BASIC AND SIMPLE REST API REQUEST USING DIO ####################

  void fetchNotes() async {
    setState(() {
      isLoading = true; // Start loading
    });

    try {
      var response = await Dio().get('https://6767d711c1de2e6421c86392.mockapi.io/api/v1/notes');
      setState(() {
        notes = response.data;
        print('DATA COLLECTED IS: $notes');
      });
    } catch (e) {
      print('GET Error: $e');
    } finally {
      setState(() {
        isLoading = false; // Stop loading
      });
    }
  }

  //### END HERE THE BASIC AND SIMPLE REST API REQUEST USING DIO ####################

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(widget.title),
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Id: ${notes[index]['noteID']} | ${notes[index]['noteTitle']}',
                    style: kTxtTabTitleListTextStyle,
                  ),
                  subtitle: Text(
                    'Last Created on:: ${notes[index]['createDateTime']}'
                    '\n'
                    'Last Edited on:: ${notes[index]['latestEditDateTime']}',
                  ),
                );
              },
            ),
    );
  }
}
