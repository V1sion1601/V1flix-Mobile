import 'package:app/src/features/home/widgets/history_episode.dart';
import 'package:app/src/features/video/screens/video.dart';
import 'package:app/src/models/episodes.dart';
import 'package:app/src/models/source.dart';
import 'package:app/src/utils/find_image.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.episode, required this.source});

  final Source source;
  final Episode episode;

  @override
  Widget build(BuildContext context) {
    final String title = episode.title.length > 20
        ? "${episode.title.substring(0, 20)}..."
        : episode.title;
    return InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => VideoScreen(
                      source: source,
                      episode: episode,
                    )))
      },
      child: Flex(
        direction: Axis.vertical,
        children: [
          Stack(
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    findImage(episode.series?.images, "cover"),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: HistoryEpisode(
                    epNum: episode.epNum.toString(),
                    title: title,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
            width: 10,
          )
        ],
      ),
    );
  }
}
