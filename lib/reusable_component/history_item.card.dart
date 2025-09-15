import 'package:flutter/material.dart';

class HistoryItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final VoidCallback onDelete;
  final bool showCheckIcon;

  const HistoryItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.onDelete,
    this.showCheckIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        onDelete(); 
      },
      child: Card(
        color: Colors.green.shade400,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          trailing: showCheckIcon
              ? const Icon(Icons.check_circle, color: Colors.white)
              : null,
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          subtitle: Text(
            "$description\nKategori: $category",
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}