import 'package:flutter/material.dart';
import 'package:nowaste_app/core/constants/app_colors.dart';
import 'package:nowaste_app/features/auth/widgets/blur_blob.dart';

class GlowBackground extends StatelessWidget {
  final Widget child;
  const GlowBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.2),
                radius: 1.25,
                colors: [
                  AppColors.lightGreen.withOpacity(0.85),
                  AppColors.primary.withOpacity(0.90),
                  AppColors.darkBackground,
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),
        ),

        const BlurBlob(
          color: AppColors.lightGreen,
          size: 240,
          offset: Offset(-80, 140),
        ),
        const BlurBlob(
          color: AppColors.primary,
          size: 200,
          offset: Offset(160, -20),
        ),
        const BlurBlob(
          color: AppColors.darkGreen,
          size: 260,
          offset: Offset(60, 420),
          opacity: 0.5,
        ),

        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.20),
                  Colors.transparent,
                  Colors.black.withOpacity(0.40),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),

        Positioned.fill(child: child),
      ],
    );
  }
}
