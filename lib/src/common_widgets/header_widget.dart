import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String username;
  const Header({super.key, required this.username});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Hello ${username == '' ? 'guest' : username}",
          style: const TextStyle(color: Colors.white),
        ),
        actions: const <Widget>[
          Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          )
        ],

        bottomOpacity: 0.3,
      ),
    );
  }
}
