class TodoModel {
  final String title;
  final String description;
  final String category;
  bool isDone;

  TodoModel({
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
  });
}
