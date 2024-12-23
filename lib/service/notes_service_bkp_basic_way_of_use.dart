import 'package:my_imc_calc_app/Model/note_entity.dart';

class NotesServiceBasiscs {
  List<NoteEntity> getNotesList() {
    return [
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
      ),
      NoteEntity(
        noteID: "5",
        noteTitle: "You are the Best 5",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
      )
    ];
  }
}
