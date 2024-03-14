import 'package:app/src/common_widgets/loading.dart';
import 'package:app/src/features/profile/services/profile.dart';
import 'package:app/src/features/profile/widgets/favorites.dart';
import 'package:app/src/features/profile/widgets/header.dart';
import 'package:app/src/features/profile/widgets/stats.dart';
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
  Users user = Users(username: "", id: "");
  late bool loading = true;

  @override
  void initState() {
    super.initState();

    _load();
  }

  void _load() async {
    user = await _profileDataService.getUserData(username: widget.username);
    print("Avatar p1: ${user.avatar}");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Loading(message: "Getting profile Data")
          : Column(
              children: <Widget>[
                HeaderProfile(
                  avatar: user.avatar!,
                  username: user.username,
                ),
                const SizedBox(height: 10,),
                StatsProfile(
                    meanScore: user.stats!.meanScore,
                    totalEpisodes: user.stats!.totalEpisodes,
                    daysWatched: user.stats!.daysWatched),
                const SizedBox(height: 10,),
                Favorites(listFavorites: user.favorites ?? [])
              ],
            ),
    );
  }
}
