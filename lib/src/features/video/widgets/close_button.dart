import 'package:app/src/constants/colors.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }
}
