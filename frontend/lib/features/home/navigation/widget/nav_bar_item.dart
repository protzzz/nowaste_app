import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';

class NavBarItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final String selectedSvgPath;
  final String unselectedSvgPath;
  final double widthSelected;
  final double widthUnselected;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.selectedSvgPath,
    required this.unselectedSvgPath,
    required this.widthSelected,
    required this.widthUnselected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = AppColors.lightGreen;
    final unselectedColor = Colors.grey.shade600;

    final color = isSelected ? selectedColor : unselectedColor;
    final iconPath =
        isSelected ? selectedSvgPath : unselectedSvgPath;
    final width = isSelected ? widthSelected : widthUnselected;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(130),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath, width: width, color: color),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
