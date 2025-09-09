import 'package:get/get.dart';

class TodoController extends GetxController {
  var todos = <String>[].obs;

  void addTodo(String title) {
    if (title.trim().isNotEmpty) {
      todos.add(title);
    }
  }

  void removeTodo(int index) {
    todos.removeAt(index);
  }
}
