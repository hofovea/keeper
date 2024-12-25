import 'package:get_it/get_it.dart';
import 'package:keeper/core/database/database.dart';
import 'package:keeper/core/services/database_service.dart';
import 'package:keeper/feats/keeper/data/db_layers/todo_item_db_layer.dart';
import 'package:keeper/feats/keeper/data/repository_impl/todo_item_repository.dart';
import 'package:keeper/feats/keeper/domain/repository/todo_item_repository.dart';

void setupServiceLocator() {
  GetIt.I.registerSingleton<Database>(Database());
  GetIt.I.registerLazySingleton<TodoItemDbLayer>(
    () => TodoItemDbLayer(),
  );
  GetIt.I.registerLazySingleton<ITodoItemRepository>(
    () => TodoItemRepository(
      GetIt.I.get<TodoItemDbLayer>(),
    ),
  );

  // GetIt.I.registerLazySingleton<DatabaseService>(
  //   () => DatabaseService(
  //     GetIt.I<Database>(),
  //   ),
  // );
}
