import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoController _todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My ToDo List"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (_todoController.todos.isEmpty) {
          return const Center(
            child: Text("Belum ada todo, tambah dulu yuk!"),
          );
        }
        return ListView.builder(
          itemCount: _todoController.todos.length,
          itemBuilder: (context, index) {
            final todo = _todoController.todos[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: Icon(
                  todo.isDone ? Icons.check_circle : Icons.task,
                  color: todo.isDone ? Colors.green : Colors.blue,
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration:
                        todo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text("${todo.description} • ${todo.category}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.done, color: Colors.green),
                      onPressed: () {
                        _todoController.toggleTodoStatus(index);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _todoController.deleteTodo(index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog() {
    Get.defaultDialog(
      title: "Tambah Todo",
      content: Column(
        children: [
          TextField(
            controller: _todoController.titleController,
            decoration: const InputDecoration(hintText: "Judul todo"),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _todoController.descController,
            decoration: const InputDecoration(hintText: "Deskripsi todo"),
          ),
          const SizedBox(height: 10),
          Obx(() => DropdownButton<String>(
                value: _todoController.selectedCategory.value,
                items: _todoController.categories
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    _todoController.setCategory(value);
                  }
                },
              )),
        ],
      ),
      textConfirm: "Simpan",
      textCancel: "Batal",
      confirmTextColor: Colors.white,
      onConfirm: () {
        _todoController.addTodo();
      },
    );
  }
}
