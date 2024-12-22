// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/Model/note_entity.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';
import 'package:my_imc_calc_app/service/notes_service.dart';

 final notes_old = [

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

 //#### THIS ONE IS A BASIC EXAMPLE TO GET DATA FROM A SERVICE CLASS ####
 final notes = NotesService().getNotesList();

 String formatDateTime(DateTime dateTime){
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
 }

class NoteListPage extends StatelessWidget {
  const NoteListPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => const Divider(
          height: 1,
          color: Colors.black,
        ),
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(notes[index].noteTitle, style: kTxtTitleListTextStyle),
            subtitle: Text('Last edited on ${formatDateTime(notes[index].latestEditDateTime)}'),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
