import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';
import 'package:todolist_application/models/todo_model.dart';

class EditTodoController extends GetxController {
  late int index;
  late TodoController todoController;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final RxString selectedCategory = "".obs;

  @override
  void onInit() {
    super.onInit();
    index = Get.arguments as int;
    todoController = Get.find<TodoController>();

    final todo = todoController.todos[index];
    titleController.text = todo.title;
    descController.text = todo.description;
    selectedCategory.value = todo.category;
  }

  void saveTodo() {
    todoController.todos[index] = TodoModel(
      title: titleController.text,
      description: descController.text,
      category: selectedCategory.value,
      isDone: todoController.todos[index].isDone,
    );
    todoController.todos.refresh();
    Get.back();
    Get.snackbar("Success", "Todo berhasil diupdate!");
  }
}
