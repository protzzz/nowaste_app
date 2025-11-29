import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste_app/core/configs/app_images.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';
import 'package:nowaste_app/core/extensions/navx.dart';
import 'package:nowaste_app/core/services/shared_preferences_service.dart';
import 'package:nowaste_app/features/auth/cubit/auth_cubit.dart';
import 'package:nowaste_app/features/auth/pages/login_page.dart';
import 'package:nowaste_app/features/auth/pages/signup_page.dart';
import 'package:nowaste_app/features/home/pages/home_page.dart';
import 'package:nowaste_app/features/intro/widgets/splash_animated_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash-page';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  // first init check
  final _sharedPreferencesService = SharedPreferencesService();
  bool _isFirstLaunch = false;
  bool _prefsLoaded = false;

  // animation init
  late final AnimationController _controller;
  late Animation<Alignment> _alignment1;
  late Animation<Alignment> _alignment2;
  late Animation<Alignment> _alignment3;
  late Animation<double> _radius1;
  late Animation<double> _radius2;
  late Animation<double> _radius3;

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getUserData();

    _initAnimations();
    _loadFirstLaunchFlag();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (!_prefsLoaded) return;

        print("State is $state");

        await Future.delayed(Duration(seconds: 2));

        // Future code for OnboardingPage settings
        // if (_isFirstLaunch) {
        //   await _sharedPreferencesService.setHasOnboarded();
        //   context.replaceWith(OnboardingPage.routeName);
        //   return;
        // }

        if (state is AuthLoggedIn) {
          context.replaceWith(HomePage.routeName);
        } else if (state is AuthInitial) {
          context.replaceWith(LoginPage.routeName);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.darkGreen,
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              children: [
                // first ball
                SplashAnimatedContainer(
                  alignment: _alignment1.value,
                  radius: _radius1.value,
                  color1: Colors.orange.shade900,
                  color2: Colors.transparent,
                  stop1: 0.25,
                ),

                // second ball
                SplashAnimatedContainer(
                  alignment: _alignment2.value,
                  radius: _radius2.value,
                  color1: Colors.red.shade800,
                  color2: Colors.transparent,
                ),

                // third ball
                SplashAnimatedContainer(
                  alignment: _alignment3.value,
                  radius: _radius3.value,
                  color1: Color(0xFF23D976),
                  color2: Colors.transparent,
                ),

                // icon and app name
                Padding(
                  padding: const EdgeInsets.only(bottom: 200),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          width: 100,
                          AppImages.splashIcon,
                        ),
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
      ),
    );
  }

  Future<void> _loadFirstLaunchFlag() async {
    final isFirst = await _sharedPreferencesService.isFirstLaunch();

    setState(() {
      _isFirstLaunch = isFirst;
      _prefsLoaded = true;
    });
  }

  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
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
  }
}
