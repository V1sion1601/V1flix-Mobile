import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/sign_up/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Register", home: SignUpForm());
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonColors["bgColor"],
      body: const Center(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: SignUpForm(),
        ),
      ),
    );
  }
}
