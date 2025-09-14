import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';
import 'package:todolist_application/reusable_component/custom_dropdown.dart';
import 'package:todolist_application/reusable_component/primary_button.dart';
import 'package:todolist_application/reusable_component/textfield_add.dart';
import 'package:todolist_application/reusable_component/page_title.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Tambah Todo",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFFF44336), 
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageTitle(
              title: "Tambah",
              subtitle: "Isi detail todo kamu di bawah ini",
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
                    controller: todoController.titleController,
                    label: "Judul",
                  ),
                  const SizedBox(height: 16),
                  TextfieldAdd(
                    controller: todoController.descController,
                    icon: Icons.description,
                    label: "Deskripsi",
                    maxLines: 3,
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
              child: PrimaryButton(
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
