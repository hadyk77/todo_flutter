import 'package:get_it/get_it.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/src/features/todo/data/datasources/todo_datasource.dart';
import 'package:todo_flutter/src/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_flutter/src/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_flutter/src/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:todo_flutter/src/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_flutter/src/features/todo/domain/usecases/get_todo_list_usecase.dart';
import 'package:todo_flutter/src/features/todo/domain/usecases/toggle_todo_usecase.dart';

final sl = GetIt.instance;

setUp() {
  sl.registerSingleton(Client('http://localhost:8080/')..connectivityMonitor = FlutterConnectivityMonitor());

  sl.registerFactory<TodoDatasource>(() => TodoDatasourceImpl(sl()));
  sl.registerFactory<TodoRepository>(() => TodoRepositoryImpl(sl()));
  sl.registerFactory(() => GetTodoListUsecase(sl()));
  sl.registerFactory(() => AddTodoUsecase(sl()));
  sl.registerFactory(() => DeleteTodoUsecase(sl()));
  sl.registerFactory(() => ToggleTodoUsecase(sl()));
}
