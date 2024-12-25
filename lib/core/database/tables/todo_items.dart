import 'package:drift/drift.dart';

class TodoItemsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 0, max: 16)();

  TextColumn get content => text().nullable()();
}
