// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoteEntity {

  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  NoteEntity({
    required this.noteID,
    required this.noteTitle,
    required this.createDateTime,
    required this.latestEditDateTime,
  });
}
