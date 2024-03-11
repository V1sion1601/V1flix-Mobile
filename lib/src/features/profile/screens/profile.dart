import 'package:app/src/features/profile/services/profile.dart';
import 'package:app/src/models/users.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.username});

  final String username;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileDataService _profileDataService = ProfileDataService();
  Users user = Users(username: "", id: '');
  late bool loading = true;

  @override
  void initState() {
    super.initState();

    _load();
  }

  void _load() async {
    user = await _profileDataService.getUserData(username: widget.username);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        user.username,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
