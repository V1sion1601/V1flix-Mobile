import 'package:app/src/features/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
//constants
import 'package:app/src/constants/colors.dart';




class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Log-in", home: SignInForm());
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonColors["bgColor"],
      body: const Center(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: SignInState(),
        ),
      ),
    );
  }
}
