import 'package:dartz/dartz.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/src/core/exceptions/failure.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodoList({int? id});
  Future<Option<Failure>> add(Todo todo);
  Future<Option<Failure>> toggleTodo(int id);
  Future<Option<Failure>> deleteTodo(int id);
}
