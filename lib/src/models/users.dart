import 'dart:ffi';

import 'package:app/src/models/series.dart';

class Stats {
  final double meanScore;
  final double daysWatched;
  final double totalEpisodes;

  Stats(
      {required this.meanScore,
      required this.daysWatched,
      required this.totalEpisodes});

  static Stats fromMap({required Map stats}) {
    return Stats(
        daysWatched: stats["days_watched"].toDouble(),
        meanScore: stats["mean_score"].toDouble(),
        totalEpisodes: stats["total_episodes"].toDouble());
  }
}

class UserList {
  final Series series;
  final int currentEp;
  final String status;

  UserList({
    required this.series,
    required this.status,
    required this.currentEp,
  });

  static UserList fromMap({required Map userItem}) {
    return UserList(
        series: Series.fromMap(map: userItem["series"]),
        status: userItem["status"],
        currentEp: userItem["currentEp"]);
  }
}

class Users {
  final String id;
  final String username;
  final String? avatar;
  final Stats? stats;
  final List<Series>? favorites;
  final List<UserList>? userList;

  Users(
      {required this.id,
      required this.username,
      this.avatar,
      this.stats,
      this.favorites,
      this.userList});

  static Users fromMap({required Map user}) {
    String avatar = "https://v1flix-v2.netlify.app/assets/avatar.png";
    Stats tempStats = Stats(daysWatched: 0, totalEpisodes: 0, meanScore: 0);
    List<Series> favorites = [];
    List<UserList> userList = [];

    if (user["avatar"] != null && user["avatar"] != "") {
      avatar = user["avatar"];
    }
    if (user["stats"] != null) {
      tempStats = Stats.fromMap(stats: user["stats"]);
    }

    if (user["favoriteList"] != null && user["favoriteList"].isNotEmpty) {
      print("Favorites: ${user["favoriteList"].length}");
      favorites = List<Series>.from(
          user["favoriteList"].map((series) => Series.fromMap(map: series)));
    }

    if (user["list"] != null) {
      print("User List: ${user["list"].length}");
      print(user["list"][0]);
      userList = List<UserList>.from(
          user["list"].map((series) => UserList.fromMap(userItem: series)));
    }

    return Users(
        id: user["userId"] ?? "",
        username: user["username"],
        avatar: avatar,
        stats: tempStats,
        favorites: favorites,
        userList: userList);
  }
}
