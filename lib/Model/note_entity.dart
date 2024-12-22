class NoteEntity {

  String? noteID;
  String? noteTitle;
  DateTime? createDateTime;
  DateTime? latestEditDateTime;

  NoteEntity({
    this.noteID,
    this.noteTitle,
    this.createDateTime,
    this.latestEditDateTime,
  });

}
