import 'package:flutter_test/flutter_test.dart';
import 'package:rachadinha/authentication_protocol_driver.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  test('It should sign in with token AND provider should be Apple', () {
    int signInWithIdTokenCallCount = 0;
    OAuthProvider? actualProvider;
    spy(provider) {
      signInWithIdTokenCallCount += 1;
      actualProvider = provider;
    }

    final sut = SignInWithAppleAuthenticationProtocolDriver(spy);

    sut.signin();

    expect(signInWithIdTokenCallCount, equals(1));
    expect(actualProvider, equals(OAuthProvider.apple));
  });
}

typedef AuthenticateWithApple = void Function(OAuthProvider);

class SignInWithAppleAuthenticationProtocolDriver
    implements AuthenticationProtocolDriver {
  final AuthenticateWithApple _authenticate;

  SignInWithAppleAuthenticationProtocolDriver(this._authenticate);

  @override
  void signin() {
    _authenticate(OAuthProvider.apple);
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
