import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TodoController());
  }
}