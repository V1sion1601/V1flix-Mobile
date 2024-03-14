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

class Users {
  final String id;
  final String username;
  final String? avatar;
  final Stats? stats;
  final List<Series>? favorites;

  Users(
      {required this.id,
      required this.username,
      this.avatar,
      this.stats,
      this.favorites});

  static Users fromMap({required Map user}) {
    String avatar = "https://v1flix-v2.netlify.app/assets/avatar.png";
    Stats tempStats = Stats(daysWatched: 0, totalEpisodes: 0, meanScore: 0);
    List<Series> favorites = [];

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

    return Users(
        id: "",
        username: user["username"],
        avatar: avatar,
        stats: tempStats,
        favorites: favorites);
  }
}
