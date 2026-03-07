import 'package:flutter/material.dart';

class GroceryItem {
  final String name;
  final String amount;
  final String badgeText;
  final Color badgeBg;
  final Color badgeFg;
  final Color statusDot;
  final String emoji;

  GroceryItem({
    required this.name,
    required this.amount,
    required this.badgeText,
    required this.badgeBg,
    required this.badgeFg,
    required this.statusDot,
    required this.emoji,
  });
}
