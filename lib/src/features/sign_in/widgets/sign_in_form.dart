import 'package:app/src/common_widgets/account_fields.dart';
import 'package:app/src/features/sign_in/screens/sign_in.dart';
import 'package:flutter/material.dart';

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class SignInState extends StatefulWidget {
  const SignInState({super.key});

  @override
  State<SignInState> createState() => _SignInForm();
}

class _SignInForm extends State<SignInState>  {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Login',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
          ),
          AccountFields(fieldName: "username", fieldController: username),
          AccountFields(fieldName: "password", fieldController: password),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {

                }
              },
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}

