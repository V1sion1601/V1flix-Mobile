import 'package:app/src/extensions/format_duration.dart';
import 'package:app/src/models/episodes.dart';
import 'package:flutter/material.dart';

class InfoEpisode extends StatelessWidget {
  const InfoEpisode({super.key, required this.episode, required this.duration});

  final Episode episode;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Episode ${episode.epNum}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          const SizedBox(
            height: 3,
          ),
          Text(episode.title,
              style: const TextStyle(color: Colors.white, fontSize: 15)),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text(
                "${episode.view} views",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(width: 8),
              Text(
                duration.formatDuration(),
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
