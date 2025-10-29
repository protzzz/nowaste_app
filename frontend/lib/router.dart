import 'package:flutter/material.dart';
import 'package:nowaste_app/features/auth/pages/login_page.dart';
import 'package:nowaste_app/features/auth/pages/signup_page.dart';
import 'package:nowaste_app/features/home/pages/home_page.dart';
import 'package:nowaste_app/features/intro/pages/intro_page.dart';
import 'package:nowaste_app/features/intro/pages/splash_page.dart';
import 'package:nowaste_app/features/intro/pages/welcome_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => LoginPage(),
      );
    case SignUpPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SignUpPage(),
      );
    case WelcomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => WelcomePage(),
      );
    case IntroPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => IntroPage(),
      );
    case SplashPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SplashPage(),
      );
    case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomePage(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder:
            (_) => Scaffold(
              body: Center(child: Text('Page does not exist!')),
            ),
      );
  }
}
