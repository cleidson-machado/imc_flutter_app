// ignore_for_file: file_names
// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

class ListAllMessagesTabPage extends StatefulWidget {
  const ListAllMessagesTabPage({super.key, this.idTabMark, this.listAction});

  final int? idTabMark;
  final bool? listAction;

  @override
  State<ListAllMessagesTabPage> createState() => _ListAllMessagesTabPageState();
}

class _ListAllMessagesTabPageState extends State<ListAllMessagesTabPage> {
  List notesList = [];
  bool isLoading = false;
  bool hasMoreData = true;
  String? errorMessage;
  int currentPage = 0;
  final int pageSize = 5;
  final ScrollController _scrollController = ScrollController();
  bool isEmptyData = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _resetAndFetchNotes();
  }

  @override
  void didUpdateWidget(ListAllMessagesTabPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.listAction != oldWidget.listAction) {
      _resetAndFetchNotes();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _resetAndFetchNotes() {
    setState(() {
      notesList.clear();
      isLoading = false;
      hasMoreData = true;
      errorMessage = null;
      currentPage = 0;
      isEmptyData = false;
    });
    fetchNotes();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !isLoading &&
        hasMoreData) {
      fetchNotes();
    }
  }

  void fetchNotes() async {
    if (isLoading || !hasMoreData) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
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

      List fetchedNotes = rawData.sublist(
          startIndex, endIndex > rawData.length ? rawData.length : endIndex);

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
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: errorMessage != null
          ? _buildErrorWidget()
          : isEmptyData
              ? _buildEmptyDataWidget()
              : _buildListView(),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage!,
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _resetAndFetchNotes,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyDataWidget() {
    return const Center(
      child: Text(
        'No data found.',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: notesList.length + 1,
        itemBuilder: (context, index) {
          if (index < notesList.length) {
            return _buildListItem(notesList[index]);
          }

          if (!hasMoreData) {
            return _buildNoMoreDataWidget();
          }

          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> note) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Card(
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        color: Colors.black12,
        child: ListTile(
          title: Text(
            'Id: ${note['noteID']} | ${note['noteTitle']}',
            style: kTxtTabTitleListTextStyle,
          ),
          subtitle: Text(
            'Last Created on: ${note['createDateTime']}'
            '\nLast Edited on: ${note['latestEditDateTime']}'
            '\n\nMSN: ${note['contentTxtBody']}'
            '\n\nREAD: ${note['isViewed']} | Archived: ${note['isArchive']}',
          ),
          trailing: const Text('ICON'),
        ),
      ),
    );
  }

  Widget _buildNoMoreDataWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Text(
        '- Only: ${notesList.length} Items Found -',
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
