// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/features/note_rest_try_one/note_model.dart';
import 'package:my_imc_calc_app/features/note_rest_try_one/note_view_model.dart';
import 'package:my_imc_calc_app/shared_components/infinity_scroll_component.dart';
import 'package:my_imc_calc_app/shared_components/infinity_scroll_skeletonizer_component.dart';
import 'package:provider/provider.dart';

class NoteListCardsScroll extends StatefulWidget {
  const NoteListCardsScroll({super.key});

  @override
  State<NoteListCardsScroll> createState() => _NoteListCardsScrollState();
}

class _NoteListCardsScrollState extends State<NoteListCardsScroll> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final noteViewModel1 = Provider.of<NoteViewModel>(context, listen: false);
      noteViewModel1.fetchNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<NoteViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes List'),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: InfinityScrollSkeletonizerComponent<NoteModel>(
          hasMore: noteViewModel.loading,
          fetchData: () => noteViewModel.fetchNotes(),
          items: noteViewModel.notes,
          itemBuilder: (item, index) => _buildCard(item, context),
          noMoreDataText: 'No More Data!',
          loadingText: 'Loading...',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: noteViewModel.clearAndGetData,
        child: const Icon(Icons.storage_rounded),
      ),
    );
  }

  Widget _buildCard(NoteModel note, BuildContext context) {
    print(note.noteTitle);
    return Padding(
      padding: const EdgeInsets.only(top: 1, bottom: 0, left: 5, right: 5),
      child: Card(
        elevation: 2,
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
      ),
    );
  }
}
