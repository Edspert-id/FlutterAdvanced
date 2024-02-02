import 'package:flutter/material.dart';

import '../screens/base_screen.dart';

class LearningLoginButton extends StatelessWidget {
  final bool isGoogleSignIn;
  final VoidCallback onPressed;

  const LearningLoginButton(
      {super.key, required this.isGoogleSignIn, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              isGoogleSignIn ? Colors.white : Colors.black)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isGoogleSignIn
                  ? 'assets/images/google-logo.png'
                  : 'assets/images/apple-logo.png',
            ),
            const SizedBox(width: 12),
            Text(
              'Masuk Dengan ${isGoogleSignIn ? 'Google' : 'Apple'}',
              style: TextStyle(
                color: isGoogleSignIn ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
