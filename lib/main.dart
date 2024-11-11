import 'package:flutter/material.dart';
import 'package:rachadinha/login_widget.dart';

void main() {
  runApp(const AppLauncher());
}

class AppLauncher extends StatelessWidget {
  const AppLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginWidget(),
    );
  }
}
