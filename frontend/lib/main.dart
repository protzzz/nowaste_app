import 'package:flutter/material.dart';
import 'package:nowaste_app/features/intro/pages/splash_page.dart';
import 'package:nowaste_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'No Waste',
      onGenerateRoute: (settings) => generateRoute(settings),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: SplashPage(),
    );
  }
}
