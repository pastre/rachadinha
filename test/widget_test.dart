import 'infrastructure/test_dsl.dart';

void main() {
  testAcceptanceCriteria('''
    GIVEN the user is not authenticated
    WHEN they open the app
    THEN the app displays the Apple Sign-In button
    AND the user cannot access any other features until signed in.
    ''', (dsl) {
    dsl.signout().openApp().verifySignInWithAppleIsVisible();
  });

  testAcceptanceCriteria(
    '''
    GIVEN the app is opened
    AND the user is not signed in
    WHEN they authenticate with Apple
    THEN the user is granted access to the app
    ''',
    (TestDSL dsl) async {
      dsl.signout().openApp().tapOnLoginButton().verifyHomeIsVisible();
    },
  );
}
