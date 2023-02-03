import 'package:dartz/dartz.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/src/core/exceptions/failure.dart';
import 'package:todo_flutter/src/features/todo/domain/repositories/todo_repository.dart';

class GetTodoListUsecase {
  final TodoRepository _repository;

  GetTodoListUsecase(this._repository);

  Future<Either<Failure, List<Todo>>> call({int? id}) {
    return _repository.getTodoList(id: id);
  }
}
