import 'package:flutter/material.dart';
import 'package:nowaste_app/features/home/fridge/widgets/grocery_item.dart';

class GroceryItemCard extends StatelessWidget {
  final GroceryItem item;
  const GroceryItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 17,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            // blurRadius: 18,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Item emoji
                  Text(
                    item.emoji,
                    style: const TextStyle(fontSize: 25, height: 1),
                  ),

                  // Item status
                  Container(
                    // margin: EdgeInsets.only(bottom: 10),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: item.statusDot,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              // Item name
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 6),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.amount,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Item time left
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: item.badgeBg,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.06),
                      ),
                    ),
                    child: Text(
                      item.badgeText,
                      style: TextStyle(
                        color: item.badgeFg,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
