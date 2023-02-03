import 'package:dartz/dartz.dart';
import 'package:todo_flutter/src/core/exceptions/failure.dart';
import 'package:todo_flutter/src/features/todo/domain/repositories/todo_repository.dart';

class DeleteTodoUsecase {
  final TodoRepository _repository;

  DeleteTodoUsecase(this._repository);

  Future<Option<Failure>> call(int id) {
    return _repository.deleteTodo(id);
  }
}
