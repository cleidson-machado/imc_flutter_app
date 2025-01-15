// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

//VOLTAR AO ESTUDOS! USAR OU COMPARAR AINDA COM CÓDIGO DO CHAT GPT

class ListAllMessagesTabPage extends StatefulWidget {
  const ListAllMessagesTabPage({super.key, this.idTabMark, this.listAction});

  final int? idTabMark;
  final bool? listAction;

  @override
  State<ListAllMessagesTabPage> createState() => _ListAllMessagesTabPageState();
}

class _ListAllMessagesTabPageState extends State<ListAllMessagesTabPage> {

  List notesList = [];
  bool isLoading = false; // For tracking the loading state
  bool hasMoreData = true; // To track if more data is available
  String? errorMessage; // To store error messages
  int currentPage = 0; // Track the current page
  final int pageSize = 3; // Number of items to load per page
  final ScrollController _scrollController = ScrollController();
  bool isEmptyData = false; // To track if the data is empty

  @override
  void initState() {
    super.initState();
    _fetchNotes();
    _scrollListener();
  }

  void _scrollListener() {
    _scrollController.addListener(() {
        if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !isLoading && hasMoreData) {
          _fetchNotes();
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetchNotes() async {
  
    if (isLoading || !hasMoreData) return;

    setState(() {
      isLoading = true; // Start loading
      errorMessage = null; // Clear any previous error message
    });

    try {
      var response = await Dio().get(
        'https://6767d711c1de2e6421c86392.mockapi.io/api/v1/notes',
      );

      List<dynamic> rawData = response.data;

      if (widget.listAction == true) {
        // Filtrar por `isViewed == true`
        rawData = rawData.where((note) => note['isViewed'] == true).toList();
      }

      final int startIndex = currentPage * pageSize;
      final int endIndex = startIndex + pageSize;

      List fetchedNotes = rawData.sublist( startIndex, endIndex > rawData.length ? rawData.length : endIndex );

      setState(() {
        if (rawData.isEmpty) {
          isEmptyData = true;
        } else {
          notesList.addAll(fetchedNotes);
          if (fetchedNotes.length < pageSize) {
            hasMoreData = false;
          } else {
            currentPage++;
          }
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
    print('PAREI AQUI VALIDA VIA TAB INDEX PAGE: ${widget.listAction}');
    // OK TRY MAKE THE DROP DOWN BUTTON EXECUTE THE FECTH ACTION AGAIN!! 06/01/2024...
    return Scaffold(
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
                    onPressed: _fetchNotes, // Retry button
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
              : Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: notesList.length + 1,
                      itemBuilder: (context, index) {
                        if (index < notesList.length) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Card(
                                elevation: 1,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                color: Colors.black12,
                                child: ListTile(
                                  leading: CircleAvatar(child: Text('${index + 1}')),
                                  title: Text(
                                    'Id: ${notesList[index]['noteID']} | ${notesList[index]['noteTitle']}',
                                    style: kTxtTabTitleListTextStyle,
                                  ),
                                  subtitle: Text(
                                    'Last Created on: ${notesList[index]['createDateTime']}'
                                    '\n'
                                    'Last Edited on: ${notesList[index]['latestEditDateTime']}'
                                    '\n'
                                    '\n'
                                    'MSN: ${notesList[index]['contentTxtBody']}'
                                    '\n'
                                    '\n'
                                    'READ: ${notesList[index]['isViewed']} ' '| Archived: ${notesList[index]['isArchive']}',
                                  ),
                                  trailing: const Text('ICON'),
                                ),
                              ));
                        }

                        // Show a message when there's no more data to load
                        if (!hasMoreData) {
                          String notesCounter = notesList.length.toString();
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 15),
                                child: Text(
                                  '- Only: $notesCounter Itens Has been Found on The List! -',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }

                        if(pageSize < 3){
                          return null;
                        }

                        // Show loader at the bottom while loading more data
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }),
                ),
    );
  }
}
