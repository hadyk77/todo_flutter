import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/src/core/theme/colors/colors.dart';

import '../controller/todo_controller.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    Key? key,
    required this.todo,
    required this.index,
  }) : super(key: key);

  final Todo todo;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoController>();
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              controller.deleteTodo(todo.id!);
            },
            backgroundColor: Colors.transparent,
            icon: Icons.delete_outline,
            foregroundColor: AppColors.primary,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            todo.title,
            style: todo.completed
                ? const TextStyle(
                    decoration: TextDecoration.lineThrough,
                  )
                : null,
          ),
          subtitle: Text(
            DateFormat('dd MMMM yyyy').format(todo.expireDate),
          ),
          trailing: Checkbox(
            value: todo.completed,
            shape: const CircleBorder(),
            onChanged: (v) {
              controller.toggleTodo(index);
            },
          ),
        ),
      ),
    );
  }
}
