import 'package:flutter/material.dart';
import 'package:app/src/constants/colors.dart';
//Widgets
import 'package:app/src/common_widgets/bottom_navigation_widget.dart';
import 'package:app/src/common_widgets/header_widget.dart';
//Page
import 'package:app/src/features/home/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'V1flix',
        theme: ThemeData(
          scaffoldBackgroundColor: commonColors["bgColor"],
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: Header(username: ""),
          ),
          bottomNavigationBar:
              BottomNavigation(index: selectedIndex, onTap: _onItemTapped),
          body: const HomePage(),
        ));
  }
}
