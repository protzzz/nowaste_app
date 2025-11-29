import 'package:flutter/material.dart';

class SplashAnimatedContainer extends StatelessWidget {
  final Alignment alignment;
  final double radius;
  final Color color1;
  final Color color2;
  final double stop1;
  final double stop2;

  const SplashAnimatedContainer({
    super.key,
    required this.alignment,
    required this.radius,
    required this.color1,
    required this.color2,
    this.stop1 = 0.0,
    this.stop2 = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: alignment,
          radius: radius,
          colors: [color1, color2],
          stops: [stop1, stop2],
        ),
      ),
    );
  }
}
