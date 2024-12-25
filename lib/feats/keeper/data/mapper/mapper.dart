import 'package:keeper/feats/keeper/data/dto/todo_item_dto.dart';
import 'package:keeper/feats/keeper/domain/entities/todo_item.dart';

extension TodoItemDtoMapper on TodoItemDto {
  TodoItem toEntity() => TodoItem(title: title, content: content, id: id);
}

extension TodoItemMapper on TodoItem {
  TodoItemDto toDto() => TodoItemDto(id: id, title: title, content: content);
}
