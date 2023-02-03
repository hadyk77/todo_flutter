import 'package:dartz/dartz.dart';
import 'package:todo_client/src/protocol/todo_class.dart';
import 'package:todo_flutter/src/core/exceptions/exceptions.dart';
import 'package:todo_flutter/src/core/exceptions/failure.dart';
import 'package:todo_flutter/src/features/todo/data/datasources/todo_datasource.dart';
import 'package:todo_flutter/src/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoDatasource _datasource;

  TodoRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<Todo>>> getTodoList({int? id}) async {
    try {
      final result = await _datasource.getTodoList(id: id);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Option<Failure>> add(Todo todo) async {
    try {
      await _datasource.add(todo);
      return none();
    } on ServerException catch (e) {
      return some(ServerFailure(e.message));
    }
  }

  @override
  Future<Option<Failure>> deleteTodo(int id) async {
    try {
      await _datasource.deleteTodo(id);
      return none();
    } on ServerException catch (e) {
      return some(ServerFailure(e.message));
    }
  }

  @override
  Future<Option<Failure>> toggleTodo(int id) async {
    try {
      await _datasource.toggleTodo(id);
      return none();
    } on ServerException catch (e) {
      return some(ServerFailure(e.message));
    }
  }
}
