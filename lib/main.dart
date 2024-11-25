import 'package:flutter/material.dart';
import 'package:rachadinha/app_launcher.dart';
import 'package:rachadinha/authentication_protocol_driver.dart';

void main() {
  runApp(AppLauncher(DummyAuthenticationProtocolDriver()));
}

class DummyAuthenticationProtocolDriver
    implements AuthenticationProtocolDriver {
  @override
  bool isSignedin() {
    return false;
  }

  @override
  void signin() {
    // TODO: implement signin
  }

  @override
  void signout() {
    // TODO: implement signout
  }
}
