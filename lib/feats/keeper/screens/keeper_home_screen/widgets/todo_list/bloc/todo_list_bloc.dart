import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:keeper/core/core.dart';
import 'package:keeper/feats/keeper/domain/entities/todo_item.dart';
import 'package:keeper/feats/keeper/domain/repository/todo_item_repository.dart';

part 'todo_list_event.dart';

part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final ITodoItemRepository _todoItemRepository = GetIt.I.get<ITodoItemRepository>();

  TodoListBloc() : super(const TodoListStateLoading(todoList: [])) {
    on<TodoListEvent>((event, emit) async {
      switch (event) {
        case TodoListEventFetch():
          emit(const TodoListStateLoading(todoList: []));
          final allItemsList = await _todoItemRepository.getAllItems();
          emit(TodoListStateReady(todoList: allItemsList));
        case TodoListEventAdd():
          final createdItem = await _todoItemRepository.addItem(rawTodoItem: event.rawTodoItem);
          print('add');
          emit(
            TodoListStateReady(
              todoList: createdItem != null ? [...state.todoList, createdItem] : [...state.todoList],
            ),
          );
        // int maxId = 0;
        // if (state.todoList.isNotEmpty) {
        //   maxId = state.todoList.reduce((current, next) => current.id > next.id ? current : next).id;
        // }
        // final newTodoItem = TodoItem(
        //   id: maxId + 1,
        //   title: event.rawTodoItem.title,
        //   content: event.rawTodoItem.content,
        // );
        // final resultList = [...state.todoList, newTodoItem];
        // print('add');
        // print(resultList);
        // emit(
        //   TodoListStateReady(todoList: resultList),
        // );
        case TodoListEventUpdate():
          // final oldItem = state.todoList.indexed.firstWhereOrNull((item) => item.$2.id == event.updatedItem.id);
          // if (oldItem != null) {
          //   final updatedList = [...state.todoList];
          //   updatedList[oldItem.$1] = event.updatedItem;
          //   print('update');
          //   print(updatedList);
          //   emit(TodoListStateReady(todoList: updatedList));
          // } else {
          //   print('No such element to update');
          // }
          final isUpdated = await _todoItemRepository.updateItem(updatedItem: event.updatedItem);
          if (isUpdated) {
            add(const TodoListEventFetch());
          }
        case TodoListEventRemove():
          await _todoItemRepository.deleteItem(itemToDelete: event.todoItemToRemove);
          add(const TodoListEventFetch());
        // final indexToDelete = state.todoList.indexed
        //     .firstWhereOrNull(
        //       (item) => item.$2.id == event.todoItemToRemove.id,
        //     )
        //     ?.$1;
        // if (indexToDelete != null) {
        //   final resultList = state.todoList..removeAt(indexToDelete);
        //   print('delete');
        //   print(resultList);
        //   emit(TodoListStateReady(todoList: [...resultList]));
        // } else {
        //   print('No such element to delete');
        // }
      }
    });
  }
}
