import 'package:flutter/material.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile(
      {super.key, required this.avatar, required this.username});

  final String avatar;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.network(
                  "https://v1flix-v2.netlify.app/assets/cover.png"),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                avatar,
                width: 150,
                height: 150,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          username,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
