import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TodoController());
  }
}