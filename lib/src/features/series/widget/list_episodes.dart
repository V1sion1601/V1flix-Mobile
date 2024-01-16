import 'package:app/src/features/series/widget/episode_card.dart';
import 'package:app/src/models/episodes.dart';
import 'package:flutter/material.dart';

class ListEpisodes extends StatelessWidget {
  const ListEpisodes(
      {super.key, required this.episodes, required this.paddingSize, required this.duration});

  final double paddingSize;
  final List<Episode> episodes;
  final int duration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingSize, right: paddingSize, top: paddingSize),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: episodes
              .map(
                (ep) => EpisodeCard(episode: ep, duration: duration,)
              )
              .toList()),
    );
  }
}
