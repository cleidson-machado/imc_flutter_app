// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteID': noteID,
      'noteTitle': noteTitle,
      'createDateTime': createDateTime.millisecondsSinceEpoch,
      'latestEditDateTime': latestEditDateTime.millisecondsSinceEpoch,
    };
  }

  factory NoteEntity.fromMap(Map<String, dynamic> map) {
    return NoteEntity(
      noteID: map['noteID'] as String,
      noteTitle: map['noteTitle'] as String,
      createDateTime: DateTime.fromMillisecondsSinceEpoch(map['createDateTime'] as int),
      latestEditDateTime: DateTime.fromMillisecondsSinceEpoch(map['latestEditDateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteEntity.fromJson(String source) => NoteEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
