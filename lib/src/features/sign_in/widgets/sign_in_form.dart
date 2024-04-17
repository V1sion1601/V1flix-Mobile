import 'package:app/main.dart';
import 'package:app/src/features/sign_in/services/login.dart';
import 'package:app/src/common_widgets/form/error.dart';
import 'package:app/src/models/form.dart';
import 'package:flutter/material.dart';

//Widgets
import 'package:app/src/common_widgets/account/account_fields.dart';
import 'package:app/src/features/sign_in/widgets/notice.dart';
import 'package:app/src/common_widgets/account/account_navigation.dart';

//Types
import 'package:app/src/models/fields.dart';

//Constants
import 'package:app/src/constants/colors.dart';

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

List<Fields> fields = [
  Fields("email", email),
  Fields("password", password),
];

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginService _loginService = LoginService();
  FormResult result = FormResult(error: "", result: false);

  void setError(FormResult signInResult) {
    setState(() {
      result = signInResult;
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
          result.result == false && result.error != ""
              ? ErrorForm(error: result.error)
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: commonColors["secondColor"],
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  FormResult signInResult = await _loginService.getLoginResult(
                      email: email.text, password: password.text);
                  if (signInResult.result == false) {
                    setError(signInResult);
                    return;
                  }
                  if (!context.mounted) return;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const MyApp()));
                }
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
