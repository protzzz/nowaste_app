import 'package:flutter/material.dart';

class GroceryFilterChips extends StatelessWidget {
  const GroceryFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    Widget chip({
      required IconData icon,
      required String text,
      bool selected = false,
    }) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: selected ? Colors.white : const Color(0xFFF4F6F8),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: Colors.black54),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            chip(
              icon: Icons.tune,
              text: 'All Items',
              selected: true,
            ),
            const SizedBox(width: 10),
            chip(icon: Icons.eco_outlined, text: 'Vegetables'),
            const SizedBox(width: 10),
            chip(icon: Icons.local_drink_outlined, text: 'Dairy'),
            const SizedBox(width: 10),
            chip(icon: Icons.spa_outlined, text: 'Herbs'),
          ],
        ),
      ),
    );
  }
}
