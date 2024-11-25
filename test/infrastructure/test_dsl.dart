import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:rachadinha/app_launcher.dart';
import 'package:rachadinha/authentication_protocol_driver.dart';

class FakeAuthenticationProtocolDriver implements AuthenticationProtocolDriver {
  bool _isSingnedInResponse = false;
  @override
  void signout() {}

  @override
  bool isSignedin() {
    return _isSingnedInResponse;
  }

  @override
  void signin() {
    _isSingnedInResponse = true;
  }
}

class TestDSL {
  final signInWithAppleButton =
      find.widgetWithText(ElevatedButton, 'Sign in with Apple');

  final List<FutureOr<dynamic> Function()> _testSteps = [];

  final WidgetTester tester;

  final authenticationProtocolDriver = FakeAuthenticationProtocolDriver();

  TestDSL(this.tester);

  TestDSL signout() {
    authenticationProtocolDriver.signout();
    return this;
  }

  TestDSL openApp() {
    _testSteps.add(
      () => tester.pumpWidget(AppLauncher(authenticationProtocolDriver)),
    );
    return this;
  }

  TestDSL tapOnLoginButton() {
    _testSteps.add(() => tester.tap(signInWithAppleButton));
    _triggerUiUpdate();
    return this;
  }

  TestDSL verifyHomeIsVisible() {
    _testSteps.add(
      () => expect(find.text('Minhas rachadinhas'), findsOneWidget),
    );
    return this;
  }

  Future<void> verifySteps() async {
    for (final testStep in _testSteps) {
      await testStep();
    }
  }

  void _triggerUiUpdate() {
    _testSteps.add(() => tester.pump());
  }

  TestDSL verifySignInWithAppleIsVisible() {
    _testSteps.add(() => expect(signInWithAppleButton, findsOneWidget));
    return this;
  }
}

@isTest
void testAcceptanceCriteria(
  String criteria,
  FutureOr<void> Function(TestDSL) test,
) async {
  testWidgets(criteria, (tester) async {
    final dsl = TestDSL(tester);
    test(dsl);
    dsl.verifySteps();
  });
}
