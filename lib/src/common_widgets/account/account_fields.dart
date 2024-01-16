import 'package:flutter/material.dart';
//Constants
import 'package:app/src/constants/colors.dart';
//Utils
import 'package:app/src/extensions/format_string.dart';

class AccountFields extends StatelessWidget {
  const AccountFields(
      {super.key, required this.fieldName, required this.fieldController});

  final String fieldName;
  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: fieldController,
          obscureText: fieldName.contains("password"),
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: fieldName.capitalize(),
            hintStyle: const TextStyle(color: Colors.white),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: (commonColors["secondColor"])!),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
