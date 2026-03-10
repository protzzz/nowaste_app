import 'package:flutter/material.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';
import 'package:nowaste_app/features/home/fridge/widgets/fridge_header.dart';
import 'package:nowaste_app/features/home/fridge/widgets/grocery_filter_chips.dart';
import 'package:nowaste_app/features/home/fridge/widgets/grocery_item_card.dart';
import 'package:nowaste_app/features/home/fridge/widgets/grocery_item.dart';

class FridgePage extends StatelessWidget {
  const FridgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <GroceryItem>[
      GroceryItem(
        name: 'Spinach',
        amount: '200g',
        badgeText: '2 days left',
        badgeBg: Color(0xFFFFE7C7),
        badgeFg: Color(0xFFB45309),
        statusDot: Color(0xFFFBBF24), // yellow
        emoji: '🥬',
      ),
      GroceryItem(
        name: 'Paneer',
        amount: '250g',
        badgeText: '5 days left',
        badgeBg: Color(0xFFE7F8EC),
        badgeFg: Color(0xFF166534),
        statusDot: Color(0xFF22C55E),
        emoji: '🧀',
      ),
      GroceryItem(
        name: 'Tomatoes',
        amount: '500g',
        badgeText: '4 days left',
        badgeBg: Color(0xFFE7F8EC),
        badgeFg: Color(0xFF166534),
        statusDot: Color(0xFF22C55E),
        emoji: '🍅',
      ),
      GroceryItem(
        name: 'Coriander',
        amount: '50g',
        badgeText: 'Use today!',
        badgeBg: Color(0xFFFFE1E1),
        badgeFg: Color(0xFFB91C1C),
        statusDot: Color(0xFFEF4444),
        emoji: '🌿',
      ),
      GroceryItem(
        name: 'Milk',
        amount: '1L',
        badgeText: '3 days left',
        badgeBg: Color(0xFFE7F8EC),
        badgeFg: Color(0xFF166534),
        statusDot: Color(0xFF22C55E),
        emoji: '🥛',
      ),
      GroceryItem(
        name: 'Rice',
        amount: '2kg',
        badgeText: '30 days left',
        badgeBg: Color(0xFFE7F8EC),
        badgeFg: Color(0xFF166534),
        statusDot: Color(0xFF22C55E),
        emoji: '🍚',
      ),
      GroceryItem(
        name: 'Eggs',
        amount: '12 pcs',
        badgeText: '7 days left',
        badgeBg: Color(0xFFE7F8EC),
        badgeFg: Color(0xFF166534),
        statusDot: Color(0xFF22C55E),
        emoji: '🥚',
      ),
      GroceryItem(
        name: 'Yogurt',
        amount: '150g',
        badgeText: 'Use today!',
        badgeBg: Color(0xFFFFE1E1),
        badgeFg: Color(0xFFB91C1C),
        statusDot: Color(0xFFEF4444),
        emoji: '🥣',
      ),
    ];

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primary,
                  width: 1.2,
                ),
                right: BorderSide(
                  color: AppColors.primary,
                  width: 0.3,
                ),
                left: BorderSide(
                  color: AppColors.primary,
                  width: 0.3,
                ),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: SafeArea(bottom: false, child: FridgeHeader()),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 6),
            child: GroceryFilterChips(),
          ),
        ),

        // Slive
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  GroceryItemCard(item: items[index]),
              childCount: items.length,
            ),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  mainAxisExtent: 130,
                ),
          ),
        ),

        // SliverToBoxAdapter(
        //   child: Container(
        //     color: Colors.grey.shade100,
        //     height: 120,
        //   ),
        // ),
      ],
    );
  }
}
