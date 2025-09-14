import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/edit_todo_controller.dart';
import 'package:todolist_application/controllers/todo_controller.dart';
import 'package:todolist_application/reusable_component/textfield_add.dart';
import 'package:todolist_application/reusable_component/custom_dropdown.dart';
import 'package:todolist_application/reusable_component/primary_button.dart';

class EditTodoPage extends StatelessWidget {
  EditTodoPage({super.key});

  final TodoController todoController = Get.find<TodoController>();
  final EditTodoController editController = Get.find<EditTodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text("Edit Todo"),
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Edit Todo Kamu",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Perbarui detail todo di bawah ini",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextfieldAdd(
                    icon: Icons.title,
                    controller: editController.titleController,
                    label: "Judul",
                  ),
                  const SizedBox(height: 16),
                  TextfieldAdd(
                    controller: editController.descController,
                    icon: Icons.description,
                    label: "Deskripsi",
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => CustomDropdown(
                      value: editController.selectedCategory.value,
                      items: todoController.categories,
                      icon: Icons.category,
                      label: "Kategori",
                      onChanged: (value) {
                        if (value != null) {
                          editController.setCategory(value);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: "Update Todo",
                onPressed: editController.saveTodo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
