import 'package:flutter/material.dart';

extension NavX on BuildContext {
  void go(String routeName) =>
      Navigator.of(this).pushNamed(routeName);

  void replaceWith(String routeName) =>
      Navigator.of(this).pushReplacementNamed(routeName);

  void goAndClear(String routeName) => Navigator.of(
    this,
  ).pushNamedAndRemoveUntil(routeName, (route) => false);
}
