import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';
import 'package:todolist_application/reusable_component/todo_item_card.dart';
import 'package:todolist_application/reusable_component/custom_header.dart';
import 'package:todolist_application/routes/routes.dart';

class HomeWidescreenPage extends StatelessWidget {
  HomeWidescreenPage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(
                  title: "Todo (Widescreen)",
                  onAdd: () => Get.toNamed(AppRoutes.addtodo),
                ),
                const SizedBox(height: 24),
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

                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, 
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 2.5,
                      ),
                      itemCount: todoController.todos.length,
                      itemBuilder: (context, index) {
                        final todo = todoController.todos[index];
                        return TodoItemCard(
                          title: todo.title,
                          description: todo.description,
                          category: todo.category,
                          isDone: todo.isDone,
                          onToggle: () => todoController.toggleTodoStatus(index),
                          onLongPress: () {
                            todoController.deleteTodo(index);
                            Get.snackbar("Info", "Todo dihapus");
                          },
                          onEdit: () => Get.toNamed(
                            AppRoutes.edittodo,
                            arguments: index,
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
