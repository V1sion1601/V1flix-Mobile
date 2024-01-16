import 'package:app/src/constants/colors.dart';
import 'package:flutter/material.dart';

const double iconSize = 30;


List<BottomNavigationBarItem> _navigationItems = [
   BottomNavigationBarItem(
    icon: const Icon(Icons.home, size: iconSize, color: Colors.white),
    activeIcon: Icon(Icons.home, size: iconSize, color: commonColors["secondColor"]),
    label: "Home",
  ),
   BottomNavigationBarItem(
    icon: const Icon(Icons.tv, size: iconSize, color: Colors.white),
     activeIcon: Icon(Icons.tv, size: iconSize, color: commonColors["secondColor"]),
    label: "Latest",
  ),
];

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.index, required this.onTap});
  final int index;
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [..._navigationItems],
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
