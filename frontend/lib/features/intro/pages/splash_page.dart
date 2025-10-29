import 'package:flutter/material.dart';
import 'package:nowaste_app/core/configs/app_images.dart';
import 'package:nowaste_app/core/constants/app_colors.dart';
import 'package:nowaste_app/core/extensions/navx.dart';
import 'package:nowaste_app/features/auth/pages/signup_page.dart';
import 'package:nowaste_app/features/intro/pages/welcome_page.dart';

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
  late Animation<double> _radius1;
  late Animation<double> _radius2;
  late Animation<double> _radius3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);

    _alignment1 = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.centerLeft,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _alignment2 = Tween<Alignment>(
      begin: Alignment.centerRight,
      end: Alignment.topCenter,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _alignment3 = Tween<Alignment>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _radius1 = Tween<double>(begin: 0.4, end: 0.6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _radius2 = Tween<double>(begin: 0.3, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _radius3 = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    redirect();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreen,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: _alignment1.value,
                    radius: _radius1.value,
                    colors: [
                      Colors.orange.shade900,
                      // AppColors.primary,
                      Colors.transparent,
                    ],
                    stops: const [0.25, 1.0],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: _alignment2.value,
                    radius: _radius2.value,
                    colors: [
                      // AppColors.lightGreen,
                      Colors.red.shade800,
                      Colors.transparent,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: _alignment3.value,
                    radius: _radius3.value,
                    colors: const [
                      Color(0xFF23D976),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(width: 100, AppImages.splashIcon),
                      Text(
                        'No Waste',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          color: Colors.white,
                          // fontFamily: 'Roboto',
                          // fontFamily: 'Satoshi',
                          fontFamily: 'Nunito',
                          wordSpacing: -10,
                        ),
                      ),
                    ],
                  ),
                ),
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
    context.replaceWith(SignUpPage.routeName);
  }
}
