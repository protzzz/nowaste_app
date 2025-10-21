import 'package:flutter/material.dart';
import 'package:nowaste_app/core/configs/app_images.dart';
import 'package:nowaste_app/core/constants/app_colors.dart';
import 'package:nowaste_app/core/extensions/navx.dart';
import 'package:nowaste_app/features/intro/pages/welcome.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash-page';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignment1;
  late Animation<Alignment> _alignment2;
  late Animation<Alignment> _alignment3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 100),
    )..repeat(reverse: true);

    _alignment1 = AlignmentTween(
      begin: Alignment(-1.5, -1.2),
      end: const Alignment(1.5, 1.2),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _alignment2 = AlignmentTween(
      begin: const Alignment(1.5, 1.2),
      end: const Alignment(-1.5, -1.2),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _alignment3 = AlignmentTween(
      begin: const Alignment(0.0, -1.5),
      end: const Alignment(0.0, 1.5),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            fit: StackFit.expand,

            children: [
              Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment(-0.8, -0.6),
                        radius: 1.0,
                        colors: [
                          AppColors.primary,
                          AppColors.darkGreen,
                        ],
                        stops: [0.3, 1.0],
                      ),
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment(0.8, 0.6),
                        radius: 0.8,
                        colors: [
                          AppColors.lightGreen,
                          Colors.transparent,
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment(0.0, -0.9),
                        radius: 0.7,
                        colors: [
                          Color(0xFF23D976),
                          Colors.transparent,
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(width: 100, AppImages.splashIcon),
                      Text(
                        'No Waste',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 50,
                          color: Colors.white,
                          // fontFamily: 'Roboto',
                          // fontFamily: 'Satoshi',
                          fontFamily: 'Nunito',
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(Duration(seconds: 2));
    if (!mounted) return;
    context.replaceWith(WelcomePage.routeName);
  }
}
