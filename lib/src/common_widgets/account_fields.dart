import 'package:app/src/features/sign_in/screens/sign_in.dart';
import 'package:flutter/material.dart';

class AccountFields extends StatelessWidget {
  const AccountFields({super.key, required this.fieldName, required this.fieldController});

  final String fieldName;
  final TextEditingController fieldController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      obscureText: fieldName == 'password',
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: "Enter your $fieldName",
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
