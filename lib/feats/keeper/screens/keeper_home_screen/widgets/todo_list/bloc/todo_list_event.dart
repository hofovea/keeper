part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListEvent {
  const TodoListEvent();
}

class TodoListEventFetch extends TodoListEvent {
  const TodoListEventFetch();
}

class TodoListEventAdd extends TodoListEvent {
  final RawTodoItem rawTodoItem;

  const TodoListEventAdd({required this.rawTodoItem});
}

class TodoListEventUpdate extends TodoListEvent {
  final TodoItem updatedItem;

  const TodoListEventUpdate({required this.updatedItem});
}

class TodoListEventRemove extends TodoListEvent {
  final TodoItem todoItemToRemove;

  const TodoListEventRemove({required this.todoItemToRemove});
}
