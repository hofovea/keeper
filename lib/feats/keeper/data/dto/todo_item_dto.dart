import 'package:keeper/core/core.dart';

class TodoItemDto {
  final int id;

  final String title;

  final String content;

  TodoItemDto({required this.id, required this.title, required this.content});

  TodoItemDto.fromTableData(TodoItemsTableData tableData)
      : id = tableData.id,
        title = tableData.title,
        content = tableData.content ?? '';
}
