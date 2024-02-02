import 'package:app/src/models/episodes.dart';
import 'package:flutter/material.dart';

class InfoEpisode extends StatelessWidget {
  const InfoEpisode({super.key, required this.episode});

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    String truncatedString = episode.title.length > 30  ? "${episode.title.substring(0, 30)}..." : episode.title;

    return Expanded(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              truncatedString,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              "Episode: ${episode.epNum}",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
