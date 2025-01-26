// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/viewmodel/note_view_model.dart';
import 'package:provider/provider.dart';

class NoteListView extends StatelessWidget {

  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final noteViewModel = Provider.of<NoteViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes List'),
      ),
      body: noteViewModel.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: noteViewModel.notes.length,
              itemBuilder: (context, index) {
                final note = noteViewModel.notes[index];
                return ListTile(
                    title: Text(note.noteTitle),
                    subtitle: Text(note.contentTxtBody));
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: noteViewModel.fetchNotes,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
