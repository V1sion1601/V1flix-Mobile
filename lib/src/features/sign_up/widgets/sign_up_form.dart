import 'package:flutter/material.dart';
//Constants
import 'package:app/src/constants/colors.dart';
//Types
import 'package:app/src/types/fields.dart';
//Widgets
import 'package:app/src/common_widgets/account/account_fields.dart';
import 'package:app/src/common_widgets/account/account_navigation.dart';
import 'package:app/src/features/sign_up/widgets/notice.dart';

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController cPassword = TextEditingController();

 List<Fields> fields = [
   Fields("username", username),
   Fields("email", email),
   Fields("password", password),
   Fields("confirmed password", cPassword),
];

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Register',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
          ),
          const SizedBox(height: 10),
          const Navigation(),
          const SizedBox(height: 10),

          Column(
            children: fields.map((field) => AccountFields(
                fieldName: field.name, fieldController: field.value)).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: commonColors["secondColor"],
                minimumSize: const Size.fromHeight(
                    40), // fromHeight use double.infinity as width and 40 is the height
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: const Text(
                'Register',
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
