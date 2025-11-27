import 'package:flutter/material.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';
import 'package:nowaste_app/core/extensions/navx.dart';
import 'package:nowaste_app/core/widgets/big_app_icon.dart';
import 'package:nowaste_app/features/auth/pages/signup_page.dart';
import 'package:nowaste_app/features/home/pages/home_page.dart';
import 'package:nowaste_app/features/intro/widgets/next_button.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = '/welcome-page';
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            context.replaceWith(HomePage.routeName);
          },
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'Skip',
              // textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -330,
            left: -520,
            child: Container(
              width: width * 3,
              height: width * 2,
              decoration: const BoxDecoration(
                color: AppColors.darkGreen,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Text(
                      'Hello There! 👋',
                      textAlign: TextAlign.start,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     vertical: 10,
                  //   ),
                  //   child: Text(
                  //     'Welcome to NoWaste!',
                  //     textAlign: TextAlign.start,
                  //     style: Theme.of(
                  //       context,
                  //     ).textTheme.headlineMedium?.copyWith(
                  //       color: Colors.white,
                  //       fontSize: 30,
                  //       fontWeight: FontWeight.w700,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Welcome to ',
                          textAlign: TextAlign.start,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        BigAppIcon(
                          fontSize: 27,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 160),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Text(
                      'Your smart food tracker and waste saver.',
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        color: AppColors.darkGreen,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Align(
                    alignment: Alignment.centerRight,
                    child: NextButton(
                      onTap: () {
                        context.replaceWith(SignUpPage.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Text('Hello There!'),
        ],
      ),
    );
  }
}
