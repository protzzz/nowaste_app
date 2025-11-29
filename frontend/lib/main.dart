import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste_app/core/configs/app_theme.dart';
import 'package:nowaste_app/features/auth/cubit/auth_cubit.dart';
import 'package:nowaste_app/features/intro/pages/splash_page.dart';
import 'package:nowaste_app/router.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthCubit())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'No Waste',
      onGenerateRoute: (settings) => generateRoute(settings),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: SplashPage(),
    );
  }
}
