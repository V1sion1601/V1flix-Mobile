import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//Constants
import 'package:app/src/constants/colors.dart';
//Routes
import 'package:app/src/features/sign_in/screens/sign_in.dart';


class Notice extends StatelessWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      style: const TextStyle(
        color: Colors.white,
      ),
      children: <TextSpan>[
        const TextSpan(text: "You already have an account? Go "),
        TextSpan(
          text: 'here ',
          recognizer: TapGestureRecognizer()
            ..onTap = () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: commonColors["secondColor"],
          ),
        ),
        const TextSpan(text: "to sign-in"),
      ],
    ));
  }
}
