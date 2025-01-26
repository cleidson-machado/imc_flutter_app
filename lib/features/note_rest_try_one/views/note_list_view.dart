// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/features/note_rest_try_one/note_model.dart';
import 'package:my_imc_calc_app/features/note_rest_try_one/note_view_model.dart';
import 'package:my_imc_calc_app/shared_components/infinity_scroll_component.dart';
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
          : Center(
              child: InfinityScrollComponent<NoteModel>(
                hasMore: noteViewModel.loading,
                fetchData: () => noteViewModel.fetchNotes(),
                items: noteViewModel.notes,
                itemBuilder: (item, index) => _buildCard(item, context),
                noMoreDataText: 'None',
                loadingText: 'Node2',
              ),
            ),
    );
  }

  Widget _buildCard(NoteModel note, BuildContext context) {
    print(note.noteTitle);
    return Card(
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.album),
            title: Text(note.noteTitle),
            subtitle: Text(note.contentTxtBody),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('LISTEN'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
