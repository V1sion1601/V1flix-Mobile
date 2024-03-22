import 'package:app/src/models/episodes.dart';
import 'package:flutter/material.dart';

class InfoEpisode extends StatelessWidget {
  const InfoEpisode(
      {super.key, required this.episode, required this.screenWidth});

  final Episode episode;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    String truncatedString = screenWidth < 600 && episode.title.length > 30
        ? "${episode.title.substring(0, 30)}..."
        : episode.title;

    return Expanded(
      child: SizedBox(
        width: screenWidth * 40 / 100,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              truncatedString,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth >= 600 ? 20 : 15),
            ),
            Text(
              "Episode: ${episode.epNum}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: screenWidth >= 600 ? 15 : 10),
            ),
          ],
        ),
      ),
    );
  }
}
