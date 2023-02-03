import 'package:dartz/dartz.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/src/core/exceptions/failure.dart';
import 'package:todo_flutter/src/features/todo/domain/repositories/todo_repository.dart';

class AddTodoUsecase {
  final TodoRepository _repository;

  AddTodoUsecase(this._repository);

  Future<Option<Failure>> call(Todo todo) {
    return _repository.add(todo);
  }
}
