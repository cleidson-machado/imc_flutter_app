// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

class NoteListPageExampleD extends StatefulWidget {
  const NoteListPageExampleD({super.key, required this.title});

  final String title;

  @override
  State<NoteListPageExampleD> createState() => _NoteListPageExampleDState();
}

class _NoteListPageExampleDState extends State<NoteListPageExampleD> {
  List notesList = [];
  bool isLoading = false; // For tracking the loading state
  bool hasMoreData = true; // To track if more data is available
  String? errorMessage; // To store error messages
  int currentPage = 0; // Track the current page
  final int pageSize = 10; // Number of items to load per page
  final ScrollController _scrollController = ScrollController();
  bool isEmptyData = false; // To track if the data is empty

  @override
  void initState() {
    super.initState();
    fetchNotes();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !isLoading && hasMoreData) {
        fetchNotes();
      }
    },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void fetchNotes() async {
    if (isLoading || !hasMoreData) return;

    setState(() {
      isLoading = true; // Start loading
      errorMessage = null; // Clear any previous error message
    });

    try {
      var response = await Dio().get(
        'https://6767d711c1de2e6421c86392.mockapi.io/api/v1/notes',
      );

      List newNotes = response.data;
      
      // Calculate the subset of notes to fetch
      int startIndex = currentPage * pageSize;
      int endIndex = startIndex + pageSize;

      // Extract the data for this "page"
      List fetchedNotes = newNotes.sublist(startIndex, endIndex > newNotes.length ? newNotes.length : endIndex);

      // Mark data as empty if list is empty
      setState(() {
          if (newNotes.isEmpty) {
            isEmptyData = true; 
        }
      });

      setState(() {
        notesList.addAll(fetchedNotes);
        if (fetchedNotes.length < pageSize) {
          hasMoreData = false; // No more data to load
        } 
        else {
          currentPage++; // Increment the page counter
        }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(widget.title),
      ),
      body: errorMessage != null
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
                    onPressed: fetchNotes, // Retry button
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : isEmptyData
              ? const Center(
                  child: Text(
                    'No data found.',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: notesList.length + (hasMoreData ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < notesList.length) {
                      return ListTile(
                        title: Text(
                          'Id: ${notesList[index]['noteID']} | ${notesList[index]['noteTitle']}',
                          style: kTxtTabTitleListTextStyle,
                        ),
                        subtitle: Text(
                          'Last Created on: ${notesList[index]['createDateTime']}'
                          '\n'
                          'Last Edited on: ${notesList[index]['latestEditDateTime']}',
                        ),
                      );
                    } else {
                      // Show loader at the bottom while loading more data
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                ),
    );
  }
}
