import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rachadinha/login_widget.dart';
import 'package:rachadinha/main.dart';

void main() {
  final signInWithAppleButton =
      find.widgetWithText(ElevatedButton, 'Sign in with Apple');
  testWidgets(
    '''
    GIVEN the user is not authenticated
    WHEN they open the app
    THEN the app displays the Apple Sign-In button
    AND the user cannot access any other features until signed in.
    ''',
    (WidgetTester tester) async {
      // GIVEN

      // WHEN
      await tester.pumpWidget(const AppLauncher());

      // THEN
      expect(find.byType(LoginWidget), findsOne);

      // AND
      expect(signInWithAppleButton, findsOneWidget);
    },
  );

  testWidgets(
    '''
    GIVEN the user is on the Apple Sign-In screen
    WHEN they authenticate with Apple
    THEN the user is granted access to the app
    ''',
    (WidgetTester tester) async {
      // GIVEN
      await tester.pumpWidget(const AppLauncher());

      // WHEN
      await tester.tap(signInWithAppleButton);
      await tester.pump();

      // THEN
      expect(find.text('Minhas rachadinhas'), findsOneWidget);
    },
  );
}
