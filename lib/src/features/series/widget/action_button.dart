import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/video/screens/video.dart';
import 'package:app/src/globals/user_data.dart';
import 'package:app/src/models/episodes.dart';
import 'package:app/src/models/series.dart';
import 'package:app/src/models/source.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.paddingSize, required this.source, required this.title, required this.epNum, required  this.episode});

  final double paddingSize;
  final Source source;
  final String title;
  final int epNum;
  final Episode episode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingSize, right: paddingSize),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: commonColors["secondColor"],

          minimumSize: const Size.fromHeight(
              40), // fromHeight use double.infinity as width and 40 is the height
        ),
        onPressed: () {
          if (GlobalUserData().loggedUser.username != "") {
            Episode? existedSeries = GlobalUserData()
                .currentlyWatching
                .firstWhere(
                    (episode) =>
                episode.series?.id == episode.series?.id,
                orElse: () => Episode(id: "", title: "", epNum: 1));
            if (existedSeries.id != "") {
              GlobalUserData().currentlyWatching.remove(existedSeries);
            }
            GlobalUserData()
                .currentlyWatching
                .insert(0, episode);
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => VideoScreen(source: source, title: title, epNum: epNum,)));
        },
        icon: const Icon(Icons.play_arrow, color: Colors.white),
        label: Text(
          'Play at Episode $epNum',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
