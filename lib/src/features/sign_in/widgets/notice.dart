import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//Constants
import 'package:app/src/constants/colors.dart';
//Routes
import 'package:app/src/features/sign_up/screens/sign_up.dart';


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
        const TextSpan(text: "Don't have an account? Create "),
        TextSpan(
          text: 'here',
          recognizer: TapGestureRecognizer()
            ..onTap = () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: commonColors["secondColor"],
          ),
        ),
      ],
    ));
  }
}
