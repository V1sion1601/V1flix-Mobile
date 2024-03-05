import 'package:app/main.dart';
import 'package:app/src/globals/user_data.dart';
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
        IconButton(
          icon: Icon(
            Icons.sunny,
            color: commonColors["secondColor"],
            size: iconSize,
          ),
          onPressed: () {
            GlobalUserData().dark = true;
          },
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
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
        )
      ],
    );
  }
}
