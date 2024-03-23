import 'package:app/src/common_widgets/form/error.dart';
import 'package:app/src/common_widgets/form/succecss.dart';
import 'package:app/src/features/sign_up/models/sign_up.dart';
import 'package:app/src/features/sign_up/services/sign_up.dart';
import 'package:flutter/material.dart';

//Constants
import 'package:app/src/constants/colors.dart';

//Types
import 'package:app/src/models/fields.dart';

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
  final RegisterService _registerService = RegisterService();
  SignUpResult result = SignUpResult(error: "", result: false);

  void setResult(SignUpResult signUpResult) {
    setState(() {
      result = signUpResult;
    });
  }

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
            children: fields
                .map((field) => AccountFields(
                    fieldName: field.name, fieldController: field.value))
                .toList(),
          ),
          result.result == false && result.error != ""
              ? ErrorForm(error: result.error)
              : Container(),
          result.result == true && result.message != ""
              ? SuccessForm(success: result.message ?? "")
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: commonColors["secondColor"],
                minimumSize: const Size.fromHeight(
                    40), // fromHeight use double.infinity as width and 40 is the height
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  UserRegisterData userData = UserRegisterData(
                      username: username.text,
                      password: password.text,
                      confirmedPassword: cPassword.text,
                      email: email.text);
                  SignUpResult signUpResult = await _registerService
                      .getRegisterResult(userData: userData);
                  setResult(signUpResult);
                }
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
