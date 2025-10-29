import 'package:flutter/material.dart';
import 'package:nowaste_app/core/constants/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            // color:
            // Theme.of(context).brightness ==
            //         Brightness.dark
            //     ? Colors.white.withOpacity(0.3)
            //     : Colors.black.withOpacity(0.3),
            color: AppColors.lightGreen,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Or',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              // color:
              //     Theme.of(context).brightness ==
              //             Brightness.dark
              //         ? Colors.white
              //         : Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            // color:
            //     Theme.of(context).brightness ==
            //             Brightness.dark
            //         ? Colors.white.withOpacity(0.3)
            //         : Colors.black.withOpacity(0.3),
            color: AppColors.lightGreen,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
