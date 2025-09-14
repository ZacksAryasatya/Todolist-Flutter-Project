import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My ToDo List"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(
            child: Text("Belum ada todo, tambah dulu yuk!"),
          );
        }
        return ListView.builder(
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            final todo = todoController.todos[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.task),
                title: Text(todo),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    todoController.removeTodo(index);
                  },
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    Get.defaultDialog(
      title: "Tambah Todo",
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(hintText: "Masukkan todo baru"),
      ),
      textConfirm: "Simpan",
      textCancel: "Batal",
      confirmTextColor: Colors.white,
      onConfirm: () {
        if (textController.text.isNotEmpty) {
          todoController.addTodo(textController.text);
          Get.back();
        }
      },
      onCancel: () {},
    );
  }
}
