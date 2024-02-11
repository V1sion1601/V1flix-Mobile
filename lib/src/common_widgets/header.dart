import 'package:app/src/features/search/screens/search.dart';
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const SearchPage()));
            },
          )
        ],
        bottomOpacity: 0.3,
      ),
    );
  }
}
