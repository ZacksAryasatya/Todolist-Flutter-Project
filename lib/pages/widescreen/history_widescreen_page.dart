import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';
import 'package:todolist_application/reusable_component/custom_header.dart';
import 'package:todolist_application/reusable_component/history_item.card.dart';

class HistoryWidescreenPage extends StatelessWidget {
  HistoryWidescreenPage({super.key});

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
            const SizedBox(height: 16),

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

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GridView.builder(
                    itemCount: todos.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 3,
                    ),
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return Dismissible(
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
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: HistoryItemCard(
                            title: todo.title,
                            description: todo.description,
                            category: todo.category,
                            showCheckIcon: true,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
