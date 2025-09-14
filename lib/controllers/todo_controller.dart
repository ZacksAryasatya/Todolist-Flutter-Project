import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/models/todo_model.dart';

class TodoController extends GetxController {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  final categories = ["Sekolah", "Pekerjaan", "Pribadi"];
  var selectedCategory = "Sekolah".obs;

  var todos = <TodoModel>[].obs;
  var completedTodos = <TodoModel>[].obs;

  void setCategory(String value) {
    selectedCategory.value = value;
  }

  void addTodo() {
    if (titleController.text.isEmpty || descController.text.isEmpty) {
      Get.snackbar("Error", "Judul & Deskripsi tidak boleh kosong");
      return;
    }

    final todo = TodoModel(
      title: titleController.text,
      description: descController.text,
      category: selectedCategory.value,
    );

    todos.add(todo);
    titleController.clear();
    descController.clear();
    selectedCategory.value = categories.first;
    Get.back();
    Get.snackbar("Sukses", "Todo berhasil ditambahkan");
  }

  void completeTodoAt(int index) {
    final todo = todos[index];
    todo.isDone = true;
    completedTodos.add(todo);
    todos.removeAt(index);
    Get.snackbar(
      "Selesai",
      "Todo '${todo.title}' sudah dipindahkan ke history",
    );
  }

  void toggleTodoStatus(int index) async {
    final todo = todos[index];
    todo.isDone = !todo.isDone;
    todos.refresh();

    if (todo.isDone) {
      await Future.delayed(const Duration(milliseconds: 400));
      completedTodos.add(todo);
      todos.removeAt(index);
    }

    completedTodos.refresh();
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }

  void deleteCompletedTodo(int index) {
    completedTodos.removeAt(index);
  }
}
