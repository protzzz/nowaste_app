import 'package:flutter/material.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';

class CenterFabButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CenterFabButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 54,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppColors.lightGreen,
        foregroundColor: Colors.white,
        elevation: 3,
        splashColor: AppColors.darkGreen,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 24, color: Colors.white),
      ),
    );
  }
}
