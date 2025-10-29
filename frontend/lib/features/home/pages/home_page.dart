import 'package:flutter/material.dart';
import 'package:nowaste_app/core/widgets/big_app_icon.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: BigAppIcon(), centerTitle: true),
      body: Center(child: Text('Home Page')),
    );
  }
}
