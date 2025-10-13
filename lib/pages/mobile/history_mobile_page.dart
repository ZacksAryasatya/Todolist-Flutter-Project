import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';
import 'package:todolist_application/reusable_component/custom_header.dart';
import 'package:todolist_application/reusable_component/history_item.card.dart';

class HistoryMobilePage extends StatelessWidget {
  HistoryMobilePage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(title: "History"),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                final todos = todoController.completedTodos;

                if (todos.isEmpty) {
                  return const Center(
                    child: Text(
                      "Belum ada todo yang selesai",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Dismissible(
                        key: ValueKey(todo.title), 
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          todoController.deleteCompletedTodo(index);
                          Get.snackbar(
                            "Info",
                            "Todo '${todo.title}' dihapus dari history",
                            snackPosition: SnackPosition.TOP,
                          );
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: HistoryItemCard(
                          title: todo.title,
                          description: todo.description,
                          category: todo.category,
                          showCheckIcon: true,
                        ),
                      ),
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
