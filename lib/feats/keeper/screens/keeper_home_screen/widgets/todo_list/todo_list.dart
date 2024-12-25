import 'package:flutter/material.dart';
import 'package:keeper/feats/keeper/domain/entities/todo_item.dart';
import 'package:keeper/feats/keeper/screens/keeper_home_screen/widgets/todo_list/bloc/todo_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_item_widget.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  final rawTodoItemSample = (content: 'Write your task here', title: 'New item');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoListBloc()..add(const TodoListEventFetch()),
      child: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Todo List'),
            ),
            body: ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return TodoItemWidget(
                  key: UniqueKey(),
                  item: state.todoList[index],
                  onDelete: () {
                    print('on delete');
                    BlocProvider.of<TodoListBloc>(context).add(
                      TodoListEventRemove(todoItemToRemove: state.todoList[index]),
                    );
                  },
                  onUpdate: (TodoItem updatedItem) {
                    BlocProvider.of<TodoListBloc>(context).add(
                      TodoListEventUpdate(updatedItem: updatedItem),
                    );
                  },
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<TodoListBloc>(context).add(
                  TodoListEventAdd(rawTodoItem: rawTodoItemSample),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
