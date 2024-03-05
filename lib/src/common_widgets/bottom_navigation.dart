import 'package:app/src/constants/colors.dart';
import 'package:flutter/material.dart';

const double iconSize = 30;

List<BottomNavigationBarItem> _navigationItems(String username) {
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home, size: iconSize, color: Colors.white),
      activeIcon:
          Icon(Icons.home, size: iconSize, color: commonColors["secondColor"]),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.tv, size: iconSize, color: Colors.white),
      activeIcon:
          Icon(Icons.tv, size: iconSize, color: commonColors["secondColor"]),
      label: "Latest",
    )
  ];
  if (username == "") {
    items.add(BottomNavigationBarItem(
      icon: const Icon(Icons.login, size: iconSize, color: Colors.white),
      activeIcon:
          Icon(Icons.login, size: iconSize, color: commonColors["secondColor"]),
      label: "Login",
    ));
  }

  return items;
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key,
      required this.index,
      required this.onTap,
      required this.username});

  final int index;
  final void Function(int) onTap;
  final String username;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [..._navigationItems(username)],
      unselectedLabelStyle: const TextStyle(color: Colors.white),
      selectedLabelStyle: TextStyle(
          color: commonColors["secondColorBrighter"],
          fontWeight: FontWeight.bold),
      unselectedItemColor: Colors.white,
      selectedItemColor: commonColors["secondColor"],
      backgroundColor: commonColors["opacityText"],
      currentIndex: index,
      onTap: onTap,
    );
  }
}
