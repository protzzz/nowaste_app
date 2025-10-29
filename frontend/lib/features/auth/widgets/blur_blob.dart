import 'dart:ui';
import 'package:flutter/material.dart';

class BlurBlob extends StatelessWidget {
  final Color color;
  final double size;
  final Offset offset;
  final double opacity;

  const BlurBlob({
    required this.color,
    required this.size,
    required this.offset,
    this.opacity = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
