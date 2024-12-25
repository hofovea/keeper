import 'package:get_it/get_it.dart';
import 'package:keeper/core/database/tables/todo_items.dart';

import '../database/database.dart';

mixin DatabaseService {
  final Database database = GetIt.I.get<Database>();
}

///T for Dto type, R for Raw Dto type
abstract class DatabaseActions<T, R> with DatabaseService {
  Future<T?> insert(R rawItem);

  Future<bool> update(T item);

  Future<void> delete(T item);

  Future<List<T>> getAll();
}
