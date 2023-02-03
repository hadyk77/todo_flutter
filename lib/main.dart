import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/src/core/theme/apptheme.dart';
import 'package:todo_flutter/src/dependency_injection.dart';
import 'package:todo_flutter/src/features/todo/presentation/pages/todo_list_screen.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.generate(""),
      home: const TodoListScreen(),
    );
  }
}
