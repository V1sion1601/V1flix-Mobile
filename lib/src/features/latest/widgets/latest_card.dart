import 'package:app/src/features/latest/widgets/info_episode.dart';
import 'package:app/src/models/episodes.dart';
import 'package:app/src/utils/find_image.dart';
import 'package:flutter/material.dart';

class LatestCard extends StatelessWidget {
  const LatestCard({super.key, required this.episode});

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: 150,
                child: Image.network(
                  episode.thumbnail == ''
                      ? defaultImage("thumbnail")
                      : episode.thumbnail,
                  fit: BoxFit.fill,
                  height: 100,
                )),
            const SizedBox(
              width: 10,
            ),
            InfoEpisode(episode: episode)
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
