import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:keeper/core/database/tables/todo_items.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TodoItemsTable])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'storage');
  }
}
