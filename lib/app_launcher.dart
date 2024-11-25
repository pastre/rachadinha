import 'package:flutter/material.dart';
import 'package:rachadinha/authentication_protocol_driver.dart';
import 'package:rachadinha/home_widget.dart';
import 'package:rachadinha/login_widget.dart';

class AppLauncher extends StatefulWidget {
  final AuthenticationProtocolDriver authenticationProtocolDriver;
  const AppLauncher(this.authenticationProtocolDriver, {super.key});

  @override
  State<AppLauncher> createState() => _AppLauncherState();
}

class _AppLauncherState extends State<AppLauncher> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widget.authenticationProtocolDriver.isSignedin()
          ? const HomeWidget()
          : LoginWidget(
              onLoginPressed: () => setState(
                () => widget.authenticationProtocolDriver.signin(),
              ),
            ),
    );
  }
}
