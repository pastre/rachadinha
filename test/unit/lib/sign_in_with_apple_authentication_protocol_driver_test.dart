import 'package:flutter_test/flutter_test.dart';
import 'package:rachadinha/authentication_protocol_driver.dart';

void main() {
  test('It should sign in with token', () {
    int signInWithIdTokenCallCount = 0;

    signInWithIdTokenStub() {
      signInWithIdTokenCallCount += 1;
    }

    final sut =
        SignInWithAppleAuthenticationProtocolDriver(signInWithIdTokenStub);
    sut.signin();

    expect(signInWithIdTokenCallCount, equals(1));
  });
}

class SignInWithAppleAuthenticationProtocolDriver
    implements AuthenticationProtocolDriver {
  void Function() _signInWithIdToken;

  SignInWithAppleAuthenticationProtocolDriver(this._signInWithIdToken);
  @override
  void signin() {
    _signInWithIdToken();
  }

  @override
  bool isSignedin() {
    throw 'NYI';
  }

  @override
  void signout() {
    throw 'NYI';
  }
}
