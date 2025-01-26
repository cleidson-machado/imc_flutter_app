class NoteModel {
  final int id;
  final String noteTitle;
  final String contentTxtBody;
  final bool isViewed;
  final bool isArchive;
  final DateTime createDateTime;
  final DateTime latestEditDateTime;

  NoteModel({
    required this.id,
    required this.noteTitle,
    required this.contentTxtBody,
    required this.isViewed,
    required this.isArchive,
    required this.createDateTime,
    required this.latestEditDateTime,
  });

  factory NoteModel.fromjson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'] as int,
      noteTitle: json['noteTitle'] as String,
      contentTxtBody: json['contentTxtBody'] as String,
      isViewed: json['isViewed'] as bool,
      isArchive: json['isArchive'] as bool,
      createDateTime: DateTime.fromMillisecondsSinceEpoch(json['createDateTime'] as int),
      latestEditDateTime: DateTime.fromMillisecondsSinceEpoch(json['latestEditDateTime'] as int),
    );
  }

}
