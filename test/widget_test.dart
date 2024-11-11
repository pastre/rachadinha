import 'package:flutter_test/flutter_test.dart';
import 'package:rachadinha/login_widget.dart';
import 'package:rachadinha/main.dart';

void main() {
  testWidgets(
    '''
    GIVEN the user is not authenticated
    WHEN they open the app
    THEN the app displays the Apple Sign-In button
    AND the user cannot access any other features until signed in.''',
    (WidgetTester tester) async {
      // GIVEN

      // WHEN
      await tester.pumpWidget(const AppLauncher());

      // THEN
      expect(find.byType(LoginWidget), findsOne);
    },
  );
}
