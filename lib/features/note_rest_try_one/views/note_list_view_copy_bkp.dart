import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/features/note_rest_try_one/note_view_model.dart';
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
          : noteViewModel.errorMessage.isNotEmpty // Check if there's an error
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        noteViewModel.errorMessage,
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: noteViewModel.fetchNotes,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: noteViewModel.notes.length,
                  itemBuilder: (context, index) {
                    final note = noteViewModel.notes[index];
                    return ListTile(
                      title: Text(note.noteTitle),
                      subtitle: Text(note.contentTxtBody),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: noteViewModel.fetchNotes,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}


//CREATE A CARD WIDGET and Put THIS ONE I A SIMPLE METHOD..


// : InfinityScrollComponent<NoteModel>(
//   hasMore: noteViewModel.loading,
//   fetchData: () => noteViewModel.fetchNotes(),
//   items: noteViewModel.notes,
//   itemBuilder: (item, index),
//   noMoreDataText: 'None',
//   loadingText: 'Node2',
// ),