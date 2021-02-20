import 'package:flutter/material.dart';

import '../constants.dart';
import '../firebase/firebase.dart';

class LoginScreen extends StatelessWidget with FirebaseServices {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Header
            Text(
              '$appTitle',
              style: theme.textTheme.headline5,
            ),
            Text(
              'Login',
              style: theme.textTheme.subtitle2,
            ),

            Spacer(),

            /// Google Sign In
            ElevatedButton(
              child: Text('Sign in with Google'),
              onPressed: () async {
                final user = await auth.signInWithGoogle();

                if (user != null) {
                  Navigator.of(context).pushReplacementNamed('home');
                }
              },
            ),

            SizedBox(height: 20),

            /// Sign in with Apple
            ElevatedButton(
              child: Text('Sign in with Apple'),
              onPressed: () async {
                final user = await auth.signInWithApple();

                if (user != null) {
                  Navigator.of(context).pushReplacementNamed('home');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
