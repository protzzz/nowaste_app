import 'package:flutter/material.dart';
import 'package:nowaste_app/core/configs/app_images.dart';

class BigAppIcon extends StatelessWidget {
  final double fontSize;
  final Color textColor;
  final Color strokeColor;
  final double strokeWidth;
  final bool outlineOnly;

  const BigAppIcon({
    super.key,
    this.fontSize = 36,
    this.textColor = Colors.black,
    this.strokeColor = Colors.white,
    this.strokeWidth = 2,
    this.outlineOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.splashIcon, width: 60),
        const SizedBox(width: 8),
        Stack(
          children: [
            Text(
              'NoWaste',
              style: TextStyle(
                // color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                fontFamily: 'Nunito',
                foreground:
                    Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = strokeWidth
                      ..color = strokeColor,
                // fontFamily: 'Roboto',
                // fontFamily: 'Satoshi',
              ),
            ),
            if (!outlineOnly)
              Text(
                'NoWaste',
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito',
                  // fontFamily: 'Roboto',
                  // fontFamily: 'Satoshi',
                ),
              ),
          ],
        ),
      ],
    );
  }
}
