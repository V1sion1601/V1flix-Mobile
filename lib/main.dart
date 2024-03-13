import 'package:app/src/features/latest/screens/latest.dart';
import 'package:app/src/features/profile/screens/profile.dart';
import 'package:app/src/features/sign_in/screens/sign_in.dart';
import 'package:app/src/globals/user_data.dart';
import 'package:flutter/material.dart';
import 'package:app/src/constants/colors.dart';

//Widgets
import 'package:app/src/common_widgets/bottom_navigation.dart';
import 'package:app/src/common_widgets/header.dart';

//Page
import 'package:app/src/features/home/screens/home.dart';

//Env
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  String username = GlobalUserData().loggedUser.username;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions(int selectedIndex) {
    List<Widget> widgets = [const HomePage(), const LatestPage()];
    if (username == '') {
      widgets.add(const SignInPage());
    }
    else {
      widgets.add(ProfilePage(username: GlobalUserData().loggedUser.username,));
    }
    return widgets;
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
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: (selectedIndex != 2 && selectedIndex != 3)
                ? Header(
                    username: username,
                  )
                : const SizedBox(
                    height: 55,
                  ),
          ),
          bottomNavigationBar: (selectedIndex != 2 || username != '')
              ? BottomNavigation(index: selectedIndex, onTap: _onItemTapped, username: username)
              : const SizedBox(
                  height: 55,
                ),
          body: _widgetOptions(selectedIndex).elementAt(selectedIndex),
        ));
  }
}
