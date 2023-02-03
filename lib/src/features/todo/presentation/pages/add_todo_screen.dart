import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_flutter/src/features/todo/presentation/controller/todo_controller.dart';

class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({super.key});
  final controller = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Todo".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => controller.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: "Enter todo title",
                      ),
                      onChanged: (value) {
                        controller.setTitle = value;
                      },
                    ),
                    ListTile(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 30)),
                        );
                        if (date != null) {
                          controller.setExpireDate = date;
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Todo Due Date"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      subtitle: Obx(
                        () => Text(
                          DateFormat("dd MMMM yyyy").format(controller.todo.value.expireDate),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                          ),
                          onPressed: controller.todo.value.title.isNotEmpty
                              ? () async {
                                  final result = await controller.addTodo();
                                  if (result) {
                                    Get.back();
                                  }
                                }
                              : null,
                          child: const Text("Add Todo"),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
