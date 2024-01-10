import 'package:flutter/material.dart';
//Constants
import 'package:app/src/constants/colors.dart';

double iconSize = 30;
class Navigation extends StatelessWidget {
  const Navigation({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.sunny,
          color: commonColors["secondColor"],
          size: iconSize,
        ),
        Icon(
          Icons.home,
          size: iconSize,
          color: commonColors["secondColor"],
        )
      ],
    );
  }
}