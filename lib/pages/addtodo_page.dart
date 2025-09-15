import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';
import 'package:todolist_application/reusable_component/button_widget.dart';
import 'package:todolist_application/reusable_component/custom_dropdown.dart';
import 'package:todolist_application/reusable_component/textfield_widget.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         title: const Text("Tambah Todo"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  CustomTextField(
                    icon: Icons.title,
                    controller: todoController.titleController,
                    label: "Judul",
                    hintText: "Masukkan judul todo",
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: todoController.descController,
                    icon: Icons.description,
                    label: "Deskripsi",
                    hintText: "Masukkan deskripsi todo",
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => CustomDropdown(
                      value: todoController.selectedCategory.value,
                      items: todoController.categories,
                      icon: Icons.category,
                      label: "Kategori",
                      onChanged: (value) {
                        if (value != null) {
                          todoController.setCategory(value);
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
              child: Frame4Button(
                text: "Simpan Todo",
                onPressed: todoController.addTodo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}