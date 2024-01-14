import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 40),
        ),
      ],
    );
  }
}
