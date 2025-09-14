import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';
import 'package:todolist_application/reusable_component/todo_item_card.dart';
import 'package:todolist_application/reusable_component/custom_header.dart';
import 'package:todolist_application/routes/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              title: "Todo",
              onAdd: () {
                Get.toNamed(AppRoutes.addtodo);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (todoController.todos.isEmpty) {
                  return const Center(
                    child: Text(
                      "Belum ada todo",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: todoController.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.todos[index];
                    return TodoItemCard(
                      title: todo.title,
                      description: todo.description,
                      category: todo.category,
                      isDone: todo.isDone,
                      onToggle: () {
                        todoController.toggleTodoStatus(index);
                      },
                      onLongPress: () {
                        todoController.deleteTodo(index);
                        Get.snackbar("Info", "Todo dihapus");
                      },
                      onEdit: () {
                        Get.toNamed(
                          AppRoutes.edittodo,
                          arguments: index,
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
