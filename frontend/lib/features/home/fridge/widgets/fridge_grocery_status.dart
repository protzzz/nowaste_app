import 'package:flutter/material.dart';

class GroceryStatus extends StatelessWidget {
  final IconData icon;
  final Color iconBackgoundColor;
  final double iconSize;
  final String title;
  final String itemCount;
  final Color backgroundColor;
  final Color borderColor;
  final Color? bigTextColor;
  final Color? smallTextColor;

  const GroceryStatus({
    super.key,
    required this.icon,
    required this.title,
    required this.itemCount,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconBackgoundColor,
    this.iconSize = 16,
    this.bigTextColor,
    this.smallTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: iconBackgoundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  // Icons.check,
                  icon,
                  color: Colors.white,
                  size: iconSize,
                ),
              ),
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    // maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    itemCount,
                    // maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
