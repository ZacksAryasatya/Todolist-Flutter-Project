import 'package:flutter/material.dart';

class TodoItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final bool isDone;
  final VoidCallback onToggle;
  final VoidCallback onLongPress;
  final VoidCallback? onEdit;

  const TodoItemCard({
    super.key,
    required this.title,
    required this.category,
    required this.isDone,
    required this.onToggle,
    required this.onLongPress,
    required this.description,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: const TextStyle(color: Colors.black, fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              "Kategori: $category",
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Color(0xFF2563EB)),
              onPressed: onEdit,
              tooltip: "Edit Todo",
            ),
            IconButton(
              icon: Icon(
                isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isDone ? Colors.greenAccent : Colors.black,
              ),
              onPressed: onToggle,
              tooltip: "Tandai selesai",
            ),
          ],
        ),
        onLongPress: onLongPress,
      ),
    );
  }
}