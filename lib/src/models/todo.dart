// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String uuid;
  final String title;
  final DateTime createdAt;
  final String description;
  final bool isCompleted;

  Todo({
    required this.uuid,
    required this.title,
    required this.description,
    required this.createdAt,
    this.isCompleted = false,
  });

  Todo copyWith({
    String? uuid,
    String? title,
    DateTime? createdAt,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  int compareTo(Todo other) {
    return title.compareTo(other.title);
  }
}
