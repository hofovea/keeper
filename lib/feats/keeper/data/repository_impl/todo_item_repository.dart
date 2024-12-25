import 'package:keeper/core/typedefs/typedefs.dart';
import 'package:keeper/feats/keeper/data/db_layers/todo_item_db_layer.dart';
import 'package:keeper/feats/keeper/data/mapper/mapper.dart';
import 'package:keeper/feats/keeper/domain/entities/todo_item.dart';
import 'package:keeper/feats/keeper/domain/repository/todo_item_repository.dart';

class TodoItemRepository implements ITodoItemRepository {
  final TodoItemDbLayer _todoItemDbLayer;

  TodoItemRepository(this._todoItemDbLayer);

  @override
  Future<TodoItem?> addItem({required RawTodoItem rawTodoItem}) async {
    return (await _todoItemDbLayer.insert(rawTodoItem))?.toEntity();
  }

  @override
  Future<void> deleteItem({required TodoItem itemToDelete}) async {
    await _todoItemDbLayer.delete(itemToDelete.toDto());
  }

  @override
  Future<List<TodoItem>> getAllItems() async {
    return (await _todoItemDbLayer.getAll()).map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<bool> updateItem({required TodoItem updatedItem}) async {
    return await _todoItemDbLayer.update(updatedItem.toDto());
  }
}
