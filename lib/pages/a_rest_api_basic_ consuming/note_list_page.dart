import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/Model/note_entity.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

 final notes = [

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
  )

 ];

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
          return const ListTile(
            title: Text('Hello', style: kTxtTitleListTextStyle),
            subtitle: Text('Last editedo 21/02/2024'),
          );
        },
        itemCount: 30,
      ),
    );
  }
}
