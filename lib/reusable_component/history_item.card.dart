import 'package:flutter/material.dart';

class HistoryItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final bool showCheckIcon;
  final VoidCallback? onDelete;

  const HistoryItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    this.showCheckIcon = true, 
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFECFDF5),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showCheckIcon)
                const Icon(Icons.check_circle, color: Color(0xFF16A34A)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Colors.black, fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,  
          ),
          const SizedBox(height: 4),
          Text(
            "Kategori: $category",
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
