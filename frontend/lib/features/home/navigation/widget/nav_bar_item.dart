import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onTap;
  final bool isSelected;
  final double width;

  final Color color;

  const NavBarItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onTap,
    required this.isSelected,
    required this.width,
    required this.color,
  });

  bool get _isSvg => iconPath.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color:
                isSelected
                    // ? Color(0xFFF2F2F7)
                    ? const Color.fromARGB(239, 238, 238, 238)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIcon(),
              const SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (_isSvg) {
      return SvgPicture.asset(
        iconPath,
        width: width,
        height: width,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    }

    return Image.asset(iconPath, width: width, height: width, color: color);
  }
}
