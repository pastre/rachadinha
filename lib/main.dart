import 'package:flutter/material.dart';
import 'package:rachadinha/home_widget.dart';
import 'package:rachadinha/login_widget.dart';

void main() {
  runApp(const AppLauncher());
}

class AppLauncher extends StatefulWidget {
  const AppLauncher({super.key});

  @override
  State<AppLauncher> createState() => _AppLauncherState();
}

class _AppLauncherState extends State<AppLauncher> {
  bool _isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _isLoggedIn
          ? const HomeWidget()
          : LoginWidget(
              onLoginPressed: () => setState(
                () => _isLoggedIn = true,
              ),
            ),
    );
  }
}
