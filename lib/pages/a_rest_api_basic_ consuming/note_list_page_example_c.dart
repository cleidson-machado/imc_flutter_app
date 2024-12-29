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
  List notesStartList = [];
  bool isLoading = false; // For tracking the loading state
  String? errorMessage; // To store error messages

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  //### START HERE THE BASIC AND SIMPLE REST API REQUEST USING DIO ####################

  void fetchNotes() async {
    setState(() {
      isLoading = true; // Start loading
      errorMessage = null; // Clear any previous error message
    });

    try {
      var response = await Dio()
          .get('https://6767d711c1de2e6421c86392.mockapi.io/api/v1/notes');
      setState(() {
        notesStartList = response.data;
        print('DATA COLLECTED IS: $notesStartList');
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        print('GET Error: $e');
      });
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loading spinner
          : errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          errorMessage!,
                          style: const TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed:
                            fetchNotes, // Retry button to fetch data again
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: notesStartList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        'Id: ${notesStartList[index]['noteID']} | ${notesStartList[index]['noteTitle']}',
                        style: kTxtTabTitleListTextStyle,
                      ),
                      subtitle: Text(
                        'Last Created on:: ${notesStartList[index]['createDateTime']}'
                        '\n'
                        'Last Edited on:: ${notesStartList[index]['latestEditDateTime']}',
                      ),
                    );
                  },
                ),
    );
  }
}
