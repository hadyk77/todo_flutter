import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/src/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:todo_flutter/src/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_flutter/src/features/todo/domain/usecases/get_todo_list_usecase.dart';
import 'package:todo_flutter/src/features/todo/domain/usecases/toggle_todo_usecase.dart';

class TodoController extends GetxController {
  RxList<Todo> todoList = RxList<Todo>([]);
  final GetTodoListUsecase _getTodoListUsecase;
  final AddTodoUsecase _addTodoUsecase;
  final DeleteTodoUsecase _deleteTodoUsecase;
  final ToggleTodoUsecase _toggleTodoUsecase;
  RxBool loading = false.obs;
  late Rx<Todo> todo = Rx(
    Todo(
      title: '',
      expireDate: DateTime.now(),
      createdAt: DateTime.now(),
      completed: false,
    ),
  );

  TodoController(
    this._getTodoListUsecase,
    this._addTodoUsecase,
    this._deleteTodoUsecase,
    this._toggleTodoUsecase,
  );
  @override
  void onInit() {
    super.onInit();
    getList();
  }

  Future getList() async {
    final result = await _getTodoListUsecase();
    result.fold((l) {
      log(l.message);
    }, (r) {
      todoList.value = r;
    });
  }

  set setTitle(String title) {
    todo.value.title = title;
  }

  set setExpireDate(DateTime date) {
    todo.value.expireDate = date;
  }

  Future<bool> addTodo() async {
    loading.value = true;

    final result = await _addTodoUsecase(todo.value);
    return result.fold(() {
      getList();
      loading.value = false;
      return true;
    }, (a) {
      log(a.message);
      return false;
    });
  }

  Future<void> toggleTodo(int index) async {
    loading.value = true;
    final todo = todoList.elementAt(index);

    final result = await _toggleTodoUsecase(todo.id!);
    result.fold(
      () {
        todoList[index].completed = !todo.completed;
        loading.value = false;
      },
      (a) {
        log(a.message);
      },
    );
  }

  Future<void> deleteTodo(int id) async {
    loading.value = true;

    final result = await _deleteTodoUsecase(id);
    result.fold(
      () {
        todoList.removeWhere((element) => element.id == id);
        loading.value = false;
      },
      (a) {
        log(a.message);
      },
    );
  }
}
