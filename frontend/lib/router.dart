import 'package:flutter/material.dart';
import 'package:nowaste_app/features/intro/pages/splash_page.dart';
import 'package:nowaste_app/features/intro/pages/welcome.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case WelcomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => WelcomePage(),
      );
    case SplashPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SplashPage(),
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
