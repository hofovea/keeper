class TodoItem {
  final int id;

  final String title;

  final String content;

  TodoItem({required this.id, required this.title, required this.content});

  TodoItem copyWith({String? title, String? content, String? status}) => TodoItem(
        id: id,
        title: title ?? this.title,
        content: content ?? this.content,
      );

  @override
  String toString() => '$id $title $content';
}
