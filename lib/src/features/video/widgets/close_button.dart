import 'package:app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});
  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
      child: IconButton(
        icon: const Icon(Icons.close),
        color: Colors.white,
        style: IconButton.styleFrom(
          backgroundColor: commonColors["secondColor"],
        ),
        onPressed: () => {
          Navigator.pop(context)

        },
      ),
    );
  }
}