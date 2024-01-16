import 'package:app/src/extensions/format_duration.dart';
import 'package:app/src/models/episodes.dart';
import 'package:app/src/utils/find_image.dart';
import 'package:flutter/material.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({super.key, required this.episode, required this.duration});

  final Episode episode;
  final int duration;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
                width: 50,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(defaultImage("thumbnail")),
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Episode ${episode.epNum}",  style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 3,),
                Row(
                  children: [
                    Text(
                      "${episode.view} views",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 8,),
                    Text(
                      duration.formatDuration(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),


              ],
            )
          ],
        ),
        const SizedBox(height: 6),
        Text(
          episode.title,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 10)

      ],
    );
  }
}
