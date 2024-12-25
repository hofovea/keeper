import 'package:keeper/core/core.dart';
import 'package:keeper/feats/keeper/domain/entities/todo_item.dart';

abstract interface class ITodoItemRepository {
  Future<List<TodoItem>> getAllItems();

  Future<TodoItem?> addItem({required RawTodoItem rawTodoItem});

  Future<bool> updateItem({required TodoItem updatedItem});

  Future<void> deleteItem({required TodoItem itemToDelete});
}
