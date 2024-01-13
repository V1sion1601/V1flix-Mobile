import 'package:flutter/material.dart';

//Widgets
import 'package:app/src/common_widgets/account/account_fields.dart';
import 'package:app/src/features/sign_in/widgets/notice.dart';
import 'package:app/src/common_widgets/account/account_navigation.dart';

//Types
import 'package:app/src/types/fields.dart';

//Constants
import 'package:app/src/constants/colors.dart';

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

List<Fields> fields = [
  Fields("email", username),
  Fields("password", password),
];

class SignInState extends StatefulWidget {
  const SignInState({super.key});

  @override
  State<SignInState> createState() => _SignInForm();
}

class _SignInForm extends State<SignInState> {
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
          const SizedBox(height: 10),
          const Navigation(),
          const SizedBox(height: 10),
          Column(
            children: fields
                .map((field) => AccountFields(
                    fieldName: field.name, fieldController: field.value))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: commonColors["secondColor"],
                minimumSize: const Size.fromHeight(
                    40),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: const Text(
                'Login',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Notice(),
        ],
      ),
    );
  }
}
