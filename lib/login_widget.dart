import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  final VoidCallback onLoginPressed;

  const LoginWidget({
    required this.onLoginPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            try {
              onLoginPressed();
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("fail to log in")));
            }
          },
          child: Text('Sign in with Apple'),
        ),
      ),
    );
  }
}
