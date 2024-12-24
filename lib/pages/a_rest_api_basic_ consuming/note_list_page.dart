// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_imc_calc_app/Model/note_entity.dart';
import 'package:my_imc_calc_app/Model_API_generics/api_response_generic.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';
import 'package:my_imc_calc_app/service/notes_service.dart';

final notes_old = [
  //..................................#### THIS ONE IS THE FIRST APPROACH TO GET DATA FROM A ARRAY LIST OF DATA, JUT TO UNDERSTAND THE CONCEPT ####

  NoteEntity(
    noteID: "1",
    noteTitle: "You are the Best 1",
    createDateTime: DateTime.now(),
    latestEditDateTime: DateTime.now(),
  ),

  NoteEntity(
    noteID: "2",
    noteTitle: "You are the Best 2",
    createDateTime: DateTime.now(),
    latestEditDateTime: DateTime.now(),
  ),

  NoteEntity(
    noteID: "3",
    noteTitle: "You are the Best 3",
    createDateTime: DateTime.now(),
    latestEditDateTime: DateTime.now(),
  ),

  NoteEntity(
    noteID: "4",
    noteTitle: "You are the Best 4",
    createDateTime: DateTime.now(),
    latestEditDateTime: DateTime.now(),
  )
];

final notes_old2 = NotesService()
    .getNotesList(); //....#### THIS ONE IS A BASIC EXAMPLE TO GET DATA FROM A SERVICE CLASS ####

NotesService get service => GetIt.I<
    NotesService>(); // #### HERE USING THE SETUP LOCATOR IN THIS PAGE! ####

ApiResponseGeneric<List<NoteEntity>> _apiResponseGeneric =
    [] as ApiResponseGeneric<List<NoteEntity>>;
bool _isLoading = false;

//List<NoteEntity> notes = []; //........................ #### HERE STARTING THE LIST OF NOTES EMPTY ####

// DATE FORMATER...
String formatDateTime(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key, required this.title});
  final String title;

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  void initState() {
    // notes =service.getNotesList();
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponseGeneric = await service.getNotesList();

    setState(() {
      _isLoading = false;
    });
  }

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
      body: Builder(builder: (_) {

        if(_isLoading){
          return const CircularProgressIndicator();
        }

        if(_apiResponseGeneric.error!) {
          return const Center(child: Text('An Error: KKKKKK'));
        }

        return ListView.separated(
          separatorBuilder: (_, __) => const Divider(
            height: 1,
            color: Colors.black,
          ),
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(_apiResponseGeneric.data![index].noteTitle,
                  style: kTxtTitleListTextStyle),
              subtitle: Text(
                  'Last edited on ${formatDateTime(_apiResponseGeneric.data![index].latestEditDateTime)}'),
            );
          },
          itemCount: _apiResponseGeneric.data!.length,
        );
      }),
    );
  }
}
