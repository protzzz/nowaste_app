import 'package:flutter/material.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';
import 'package:nowaste_app/features/home/fridge/widgets/custom_search_bar.dart';
import 'package:nowaste_app/features/home/fridge/widgets/fridge_grocery_status.dart';

class FridgeHeader extends StatelessWidget {
  const FridgeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App name + short desciption + circle avatar
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'NoWaste',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        // fontFamily: 'Satoshi',
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('Smart Kitchen Assistant'),
                  ],
                ),
              ),
              SizedBox(
                width: 44,
                height: 44,
                child: Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.lightGreen,
                    child: Icon(Icons.person, size: 18),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          CustomSearchBar(hintText: 'Search groceries...'),

          const SizedBox(height: 12),

          Row(
            children: const [
              Expanded(
                child: GroceryStatus(
                  icon: Icons.check,
                  iconBackgoundColor: Color(0xFF22C55E),
                  iconSize: 19,
                  title: 'Fresh',
                  itemCount: '6 items',
                  backgroundColor: Color(0xFFE7F8EC),
                  borderColor: Color(0xFFBDECCB),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: GroceryStatus(
                  icon: Icons.priority_high,
                  iconBackgoundColor: Color(0xFFFBBF24),
                  title: 'Expiring',
                  itemCount: '1 item',
                  backgroundColor: Color(0xFFFFF1DB),
                  borderColor: Color(0xFFF2D3A8),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: GroceryStatus(
                  icon: Icons.error_outline,
                  iconBackgoundColor: Color(0xFFEF4444),
                  title: 'Urgent',
                  itemCount: '1 item',
                  iconSize: 23,
                  backgroundColor: Color(0xFFFFE1E1),
                  borderColor: Color(0xFFF2B6B6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
