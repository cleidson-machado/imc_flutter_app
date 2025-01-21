class Task {
  final String title;
  final bool isChecked;

  Task({required this.title, this.isChecked = false});

  Task copyWith({String? title, bool? isChecked}) {
    return Task(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
