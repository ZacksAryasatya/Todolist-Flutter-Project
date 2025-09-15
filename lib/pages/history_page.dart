import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';
import 'package:todolist_application/reusable_component/custom_header.dart';
import 'package:todolist_application/reusable_component/history_item.card.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

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
              title: "History",
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (todoController.completedTodos.isEmpty) {
                  return const Center(
                    child: Text(
                      "Belum ada todo yang selesai",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: todoController.completedTodos.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.completedTodos[index];
                    return HistoryItemCard(
                      title: todo.title,
                      description: todo.description,
                      category: todo.category,
                      showCheckIcon: true,
                      onDelete: () {
                        todoController.deleteCompletedTodo(index);
                        Get.snackbar("Info", "Todo dihapus dari history");
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
