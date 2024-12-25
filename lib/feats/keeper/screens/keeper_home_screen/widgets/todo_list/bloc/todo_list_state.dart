part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListState {
  final List<TodoItem> todoList;

  const TodoListState({required this.todoList});
}

class TodoListStateLoading extends TodoListState {
  const TodoListStateLoading({required super.todoList});
}

class TodoListStateReady extends TodoListState {
  const TodoListStateReady({required super.todoList});
}
