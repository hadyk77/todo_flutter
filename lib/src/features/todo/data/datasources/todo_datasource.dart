import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/src/core/exceptions/exceptions.dart';

abstract class TodoDatasource {
  Future<List<Todo>> getTodoList({int? id});
  Future<void> add(Todo todo);
  Future<void> toggleTodo(int id);
  Future<void> deleteTodo(int id);
}

class TodoDatasourceImpl extends TodoDatasource {
  final Client client;

  TodoDatasourceImpl(this.client);
  @override
  Future<List<Todo>> getTodoList({int? id}) async {
    try {
      final result = await client.todo.getTodoList(id: id);

      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> add(Todo todo) async {
    try {
      await client.todo.addTodo(todo);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteTodo(int id) async {
    try {
      await client.todo.deleteTodo(id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> toggleTodo(int id) async {
    try {
      await client.todo.toggleTodo(id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
