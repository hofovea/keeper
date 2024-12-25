import 'package:drift/drift.dart';
import 'package:keeper/core/core.dart';
import 'package:keeper/feats/keeper/data/dto/todo_item_dto.dart';

class TodoItemDbLayer extends DatabaseActions<TodoItemDto, RawTodoItem> {
  @override
  Future<TodoItemDto?> insert(RawTodoItem rawItem) async {
    final insertedTableDataItem = await database.into(database.todoItemsTable).insertReturningOrNull(
          TodoItemsTableCompanion(
            title: Value(rawItem.title),
            content: Value(rawItem.content),
          ),
        );
    return insertedTableDataItem != null ? TodoItemDto.fromTableData(insertedTableDataItem) : null;
  }

  @override
  Future<List<TodoItemDto>> getAll() async {
    final tableDataList = await (database.select(database.todoItemsTable)).get();
    return tableDataList
        .map((tableData) => TodoItemDto(
              id: tableData.id,
              title: tableData.title,
              content: tableData.content ?? '',
            ))
        .toList();
  }

  @override
  Future<bool> update(TodoItemDto item) async {
    return await (database.update(database.todoItemsTable)).replace(
      TodoItemsTableCompanion(
        id: Value(item.id),
        title: Value(item.title),
        content: Value(item.content),
      ),
    );
    // return await (
    //   database.update(database.todoItemsTable)
    //     ..where(
    //       (tbl) => tbl.id.equals(item.id),
    //     ),
    // ).$1.write();
  }

  @override
  Future<void> delete(TodoItemDto item) async {
    final matchingEntry = await (database.select(database.todoItemsTable)
          ..where((row) => row.title.equals(item.title) & row.content.equals(item.content))
          ..limit(1))
        .getSingleOrNull();

    if (matchingEntry != null) {
      await (database.delete(database.todoItemsTable)
            ..where(
              (row) => row.id.equals(matchingEntry.id),
            ))
          .go();
    }
  }
}
