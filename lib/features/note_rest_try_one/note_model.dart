class NoteModel {
  final String id; // `noteID` is a string in the JSON
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
      id: json['noteID'] as String, // Handle `noteID` as a string
      noteTitle: json['noteTitle'] as String,
      contentTxtBody: json['contentTxtBody'] as String,
      isViewed: json['isViewed'] as bool,
      isArchive: json['isArchive'] as bool,
      createDateTime: DateTime.parse(json['createDateTime']), // Parse ISO 8601 string
      latestEditDateTime: DateTime.parse(json['latestEditDateTime']), // Parse ISO 8601 string
    );
  }
}
