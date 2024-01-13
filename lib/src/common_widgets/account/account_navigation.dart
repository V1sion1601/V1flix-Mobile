import 'package:flutter/material.dart';
//Constants
import 'package:app/src/constants/colors.dart';
//Page
import 'package:app/src/features/home/screens/home.dart';

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
        IconButton(
          icon: Icon(
            Icons.home,
            size: iconSize,
            color: commonColors["secondColor"],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        )
      ],
    );
  }
}
