import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:rachadinha/main.dart';

class TestDSL {
  final signInWithAppleButton =
      find.widgetWithText(ElevatedButton, 'Sign in with Apple');

  final List<FutureOr<dynamic> Function()> _testSteps = [];

  final WidgetTester tester;

  TestDSL(this.tester);

  TestDSL signout() {
    return this;
  }

  TestDSL openApp() {
    _testSteps.add(
      () => tester.pumpWidget(const AppLauncher()),
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
