import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors/colors.dart';
import '../../../../core/theme/font_styles/font_styles.dart';
import '../../../../dependency_injection.dart';
import '../controller/todo_controller.dart';
import '../widgets/todo_item_widget.dart';
import 'add_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final controller = Get.put(TodoController(sl(), sl(), sl(), sl()), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodoScreen());
        },
        backgroundColor: AppColors.primary,
        elevation: 0,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        leading: const Icon(
          Icons.drag_handle_outlined,
          color: Colors.grey,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(AddTodoScreen());
            },
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What's app, Hady",
              style: FontStyles.h2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Todo list",
              style: FontStyles.smallText.copyWith(
                color: AppColors.grey,
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: List.generate(
                          controller.todoList.length,
                          (index) => TodoItemWidget(
                            todo: controller.todoList[index],
                            index: index,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
